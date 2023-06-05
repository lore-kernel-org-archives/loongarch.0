Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0B320FA
	for <loongarch@lists.linux.dev>; Mon,  5 Jun 2023 12:33:42 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxdPAl1n1kxxUAAA--.218S3;
	Mon, 05 Jun 2023 20:33:41 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxNeQk1n1ktncAAA--.1930S2;
	Mon, 05 Jun 2023 20:33:41 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v4 0/2] Modify code about clone timens
Date: Mon,  5 Jun 2023 20:33:28 +0800
Message-Id: <1685968410-5412-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID:AQAAf8BxNeQk1n1ktncAAA--.1930S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrur15uFyUWFyDurW8uF1ruFX_yoW3ArcE9a
	1xAa95GrWIgFy7ZasFv3WfJ34DJa109FnYyF1agr47JrW5tr13GF4kZw1UAr1Y9rW3Wrsx
	AFW8KF93Ar15KosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1EksDUUUUU==
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

v4:
  -- Add a new patch to fix broken test under !CONFIG_TIME_NS,
     thanks Thomas.
  -- Add VVAR_NR_PAGES to define VVAR_SIZE, modify stack_top(),
     thanks Wang Rui and Youling.

Tiezhu Yang (2):
  selftests/clone3: Fix broken test under !CONFIG_TIME_NS
  LoongArch: Add support to clone a time namespace

 arch/loongarch/Kconfig                         |  1 +
 arch/loongarch/include/asm/page.h              |  1 +
 arch/loongarch/include/asm/vdso/gettimeofday.h | 10 ++-
 arch/loongarch/include/asm/vdso/vdso.h         | 32 +++++++--
 arch/loongarch/kernel/process.c                |  2 +-
 arch/loongarch/kernel/vdso.c                   | 98 +++++++++++++++++++++-----
 arch/loongarch/vdso/vgetcpu.c                  |  3 +-
 tools/testing/selftests/clone3/clone3.c        |  7 +-
 8 files changed, 129 insertions(+), 25 deletions(-)

-- 
2.1.0

