Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 189901863
	for <loongarch@lists.linux.dev>; Tue, 22 Nov 2022 11:35:06 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.110])
	by gateway (Coremail) with SMTP id _____8Cx7+vos3xjcwQAAA--.59S3;
	Tue, 22 Nov 2022 19:35:04 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.110])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxPuLms3xj8xoYAA--.62977S2;
	Tue, 22 Nov 2022 19:35:04 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>
Cc: loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V2 0/2] LoongArch: Support booting with FDT
Date: Tue, 22 Nov 2022 19:32:33 +0800
Message-Id: <cover.1669112023.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxPuLms3xj8xoYAA--.62977S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvdXoWrtF4DWr1UtrW7GFyUAw48Crg_yoWkurX_ZF
	1fA348Wr48Xay7JFyDXr4fXry5Ja10gF9YyF97Xr4xCr15Arn8Jws8A3Z8Ar1qkFW8Wrs8
	ArWFq3ZYkr42qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	b7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7
	xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r
	4UYxBIdaVFxhVjvjDU0xZFpf9x07URa0PUUUUU=

Hi all:

Since LoongArch will soon support FDT booting, such as the Loongson-2K
series, this patchset adds relevant booting support and parameter
parsing.

Changes in V2:
 patch(1/2)
   - Update comments and commit messages (setup.c);
   - Give the general method to get the FDT Pointer from EFI (efi.c);
   - Add SMP support based on FDT (smp.c);
   - Call early_init_dt_scan_chosen_stdout() only when
     earlycon_acpi_spcr_enable is true (kernel/acpi.c);
   - Fix illegal access during pci root bridge registration (pci/acpi.c).
 patch(2/2)
   - Newly added.

Thanks.

Binbin Zhou (2):
  LoongArch: Support booting with FDT from efi system table
  LoongArch: Process ISA Node in DeviceTree

 arch/loongarch/Kconfig             |   2 +
 arch/loongarch/include/asm/efi.h   |   1 +
 arch/loongarch/include/asm/setup.h |   1 +
 arch/loongarch/kernel/acpi.c       |  11 ++-
 arch/loongarch/kernel/efi.c        |  19 +++-
 arch/loongarch/kernel/env.c        |   3 +
 arch/loongarch/kernel/reset.c      |   3 +-
 arch/loongarch/kernel/setup.c      | 137 ++++++++++++++++++++++++++++-
 arch/loongarch/kernel/smp.c        |  32 +++++++
 arch/loongarch/pci/acpi.c          |   5 +-
 10 files changed, 207 insertions(+), 7 deletions(-)

-- 
2.31.1

