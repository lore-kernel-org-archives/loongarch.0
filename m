Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9728F2F25E0
	for <loongarch@lists.linux.dev>; Fri, 19 Sep 2025 09:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758274585; cv=none; b=h0+kHfuEqM9NRdHS3D1uZEGF57mkvHzoj+CrPpJBlt3z5A8jxxcITYZF6xfEwSnpM9er7nS23MGAB9k+y/rZSky0JkJm3jDtF3zgsVL+lwl4O/nciRCDVXONyuAuAy7a0Uq4FWlllUP7okPHMj3VhsaNOq8CN09/wXTMyoWLa7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758274585; c=relaxed/simple;
	bh=PZBBxMZlPqezLBk05aZQCI7Xk4rFk0R/tmRiuAqXVdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hqqRw8g7Y95YtmLysmnJFXnP4CHuSJuW640OF5OKoIU7CcQEM/eFQoeutSHNsQ4A8ftpPojDkjvMNCEPBODvl14WaMNIOOp+JGwsud0zuoKIYt+dgFSTmmorMITnxw3dG+NkHg3LjRUuOq1yd/KWu0TC6F+zpd/Wx90azwpdpEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Axz78RJM1omi0MAA--.24736S3;
	Fri, 19 Sep 2025 17:36:17 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxbMEPJM1oMmufAA--.61162S2;
	Fri, 19 Sep 2025 17:36:16 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] Only link libstub to final vmlinux
Date: Fri, 19 Sep 2025 17:36:12 +0800
Message-ID: <20250919093615.30235-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxbMEPJM1oMmufAA--.61162S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1EksDUUUUU==

The initial aim is to fix the objtool warning on LoongArch,
then do the similar thing for arm64 and riscv.

Tiezhu Yang (3):
  LoongArch: Only link libstub to final vmlinux
  arm64: Only link libstub to final vmlinux
  riscv: Only link libstub to final vmlinux

 Makefile                | 1 +
 arch/arm64/Makefile     | 5 ++++-
 arch/loongarch/Makefile | 5 ++++-
 arch/riscv/Makefile     | 5 ++++-
 scripts/link-vmlinux.sh | 5 ++---
 5 files changed, 15 insertions(+), 6 deletions(-)

-- 
2.42.0

