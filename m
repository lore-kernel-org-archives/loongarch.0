Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476E454FA7
	for <loongarch@lists.linux.dev>; Tue,  5 Mar 2024 11:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709638429; cv=none; b=aIh35EUryRm/ui+AdWJa/34BEPRzktKnHK/Q5JhWv4RBDjSCeikEVMkkyM0/cDkanDoMp17Ap/eWhcymwz7/mYOaD2bTgpEfcvM9jnTtTX9TXUrzwarXeKMpSRialUgDbOO0mnU7ZsvSKjZBGqy1lw4/f/XM+P6zezJ3CPztcSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709638429; c=relaxed/simple;
	bh=Dob+dauGojVOH765x0xny+31pEVfg1FQeksdsGbh874=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WTa6J2aB35u5ox5Jsm8/WxV/4fBAQY2lQpNhV/JdMwkLjkIrt72S2k5AvcbEvzBaV1dMkUWBNkK4CJLI4bEn8msg8XYt5EXKPXIazibjXZ3/f0fP+O36EGcdr2dcOl0OxB3gYDmp6ZCjUMHbsnoX2oOCWAvwmgxc0jZBi7UdzZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8AxafAYA+dlgL8UAA--.52206S3;
	Tue, 05 Mar 2024 19:33:45 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxHBMXA+dlHIdOAA--.12290S2;
	Tue, 05 Mar 2024 19:33:43 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH] LoongArch: KVM: Set reserved bit as zero about cpucfg
Date: Tue,  5 Mar 2024 19:33:43 +0800
Message-Id: <20240305113343.1667480-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxHBMXA+dlHIdOAA--.12290S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kw4xtFWrGF1xJr4xZrWfCrX_yoW8Zr4kpr
	4Uurs5WryrKr1Iq3ZYqryv9r45Gr4xCrW7AFyFyayq9r1DWry7XrWrKFZxtF1rW34fuFyx
	uws5Aa1Y9a1DAabCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9jb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_
	JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWU
	XVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2Kfnx
	nUUI43ZEXa7IU8fsqJUUUUU==

Supported cpucfg information comes from function _kvm_get_cpucfg_mask().
It should be zero if it is reserved by HW or if it is not supported
by KVM.

Also LoongArch software page table walk feature defined in CPUCFG2_PTW
is supported by KVM, it should be enabled by default.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/vcpu.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 36106922b5d7..fc25c406021c 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -304,11 +304,15 @@ static int _kvm_get_cpucfg_mask(int id, u64 *v)
 		return -EINVAL;
 
 	switch (id) {
-	case 2:
+	case LOONGARCH_CPUCFG1:
+		/* CPUCFG1_MSGINT is not supported by KVM */
+		*v = GENMASK(25, 0);
+		return 0;
+	case LOONGARCH_CPUCFG2:
 		/* CPUCFG2 features unconditionally supported by KVM */
 		*v = CPUCFG2_FP     | CPUCFG2_FPSP  | CPUCFG2_FPDP     |
 		     CPUCFG2_FPVERS | CPUCFG2_LLFTP | CPUCFG2_LLFTPREV |
-		     CPUCFG2_LAM;
+		     CPUCFG2_LSPW | CPUCFG2_LAM;
 		/*
 		 * For the ISA extensions listed below, if one is supported
 		 * by the host, then it is also supported by KVM.
@@ -318,6 +322,21 @@ static int _kvm_get_cpucfg_mask(int id, u64 *v)
 		if (cpu_has_lasx)
 			*v |= CPUCFG2_LASX;
 
+		return 0;
+	case LOONGARCH_CPUCFG3:
+		*v = GENMASK(16, 0);
+		return 0;
+	case LOONGARCH_CPUCFG6:
+		/* PMU is not supported by KVM now */
+	case LOONGARCH_CPUCFG6 + 1 ... LOONGARCH_CPUCFG16 - 1:
+		/* Not used by HW now, need be zero */
+		*v = 0;
+		return 0;
+	case LOONGARCH_CPUCFG16:
+		*v = GENMASK(16, 0);
+		return 0;
+	case LOONGARCH_CPUCFG17 ... LOONGARCH_CPUCFG20:
+		*v = GENMASK(30, 0);
 		return 0;
 	default:
 		/*
@@ -344,7 +363,7 @@ static int kvm_check_cpucfg(int id, u64 val)
 		return -EINVAL;
 
 	switch (id) {
-	case 2:
+	case LOONGARCH_CPUCFG2:
 		if (!(val & CPUCFG2_LLFTP))
 			/* Guests must have a constant timer */
 			return -EINVAL;
-- 
2.39.3

