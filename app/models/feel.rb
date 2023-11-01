class Feel < ActiveHash::Base
  include ActiveHash::Associations
  has_many :monitorings

  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '不安' },
    { id: 2, name: '苦しい' },
    { id: 3, name: '心配' },
    { id: 4, name: '憂うつ' },
    { id: 5, name: '不快感' },
    { id: 6, name: '罪悪感' },
    { id: 7, name: '緊張' },
    { id: 8, name: 'みじめ' },
    { id: 9, name: '落ち込む' },
    { id: 10, name: '悲しい' },
    { id: 11, name: 'さみしい' },
    { id: 12, name: '動揺している' },
    { id: 13, name: '怒り' },
    { id: 14, name: '嫌悪' },
    { id: 15, name: '愛されている' },
    { id: 16, name: '感謝している' },
    { id: 17, name: '自由' },
    { id: 18, name: 'よろこび' },
    { id: 19, name: '落ち着き' },
    { id: 20, name: '充足感' },
    { id: 21, name: '好奇心' },
    { id: 22, name: '高揚感' },
    { id: 23, name: '自信' },
    { id: 24, name: '安心' },
    { id: 25, name: 'やる気がある' },
    { id: 26, name: '尊重' },
    { id: 27, name: '思いやり' },
    { id: 28, name: '感心' }
  ]
end