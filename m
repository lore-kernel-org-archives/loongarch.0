Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55801C38
	for <loongarch@lists.linux.dev>; Tue,  5 Sep 2023 08:01:51 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.9.158])
	by gateway (Coremail) with SMTP id _____8AxV_Fs4PZkUW8fAA--.64011S3;
	Tue, 05 Sep 2023 16:01:49 +0800 (CST)
Received: from kvm-1-158.loongson.cn (unknown [10.2.9.158])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxJ8xr4PZkz45sAA--.24257S2;
	Tue, 05 Sep 2023 16:01:47 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] LoongArch: Cleanup with zero page
Date: Tue,  5 Sep 2023 16:01:45 +0800
Message-Id: <20230905080147.1625448-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxJ8xr4PZkz45sAA--.24257S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7GrWfZry3CrWfZFy7KF1rGrX_yoWxAFX_Za
	47Zan5Cw4kXrWxKa1Dt3Z3Jr1jka4kWFn5Cr93XF4IvFyayrn5Xr18uw4fZrn09F4UCrs5
	C3yjqr9xZw12qosvyTuYvTs0mTUanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbfxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa02
	0Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_Wryl
	Yx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrw
	CY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
	JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
	v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
	67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j5BMNUUUUU=

There is no color page and only one page for zero page, so symbol
zero_page_mask can be removed. Also like other architectures this
patch uses statically defined zero_page in bss code segment, rather
than dynamically allocated page for zero_page usage.

---
Bibo Mao (2):
  LoongArch: Remove zero_page_mask symbol
  LoongArch: Use static defined zero page rather than allocated

 arch/loongarch/include/asm/mmzone.h  |  2 --
 arch/loongarch/include/asm/pgtable.h |  8 ++------
 arch/loongarch/kernel/numa.c         |  1 -
 arch/loongarch/mm/init.c             | 28 +---------------------------
 4 files changed, 3 insertions(+), 36 deletions(-)

-- 
2.27.0

