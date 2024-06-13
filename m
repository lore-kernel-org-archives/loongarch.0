Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AA08494
	for <loongarch@lists.linux.dev>; Thu, 13 Jun 2024 00:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718238769; cv=none; b=oHAnz8dCY9jUBUzmFnIatXYDWHonBjm35FDF0b1pC7cr+zuK5TYZQ6aQFrICyzORcJNEO87IKBJGIWY+jJqvA9H6fm+6zVvnWyJVMVKr5+OtvSPz8+5imUMdUT7jpLZ8Fh8OYm4RtOBbAtdDZP3Mhq4P6Bhk24YyQSc3LW0n9zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718238769; c=relaxed/simple;
	bh=wIdpjxSTQcJcaSC2QLNCzSZfTuBcHdMrdFb9Tzcw6jo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GGoae3a5iORfjz2piv2p/H56S3HOG6LZ2w367vmlOp+Z2JzKDdyN9HMT4aEAb6jxD7t9Z+DRUoUdRqfF6eJsxKhJQeQZFhzRqg1MuVRxawpttEDjg6829ApgsNOypfbtvZhFlHwSukbGG+sJKU3z/AZzLVb9ybd2JOq36kuzzoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9Xi6MzM; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9Xi6MzM"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6b07308fe6cso2033256d6.0
        for <loongarch@lists.linux.dev>; Wed, 12 Jun 2024 17:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718238767; x=1718843567; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3mbR6XjTl+XtcpIp/RRx4D+3ymHI9xlwahgvOSA+M8I=;
        b=V9Xi6MzMDfPk1Nift1BgyX97jmxfwH2dQQnSvgQf7MEMBMJpqo0rjRMQUU3R51UIm4
         tOMVPuEBb/3lVpG1Tp+osWfvRqCG2e7hgy9fQ2xIslOvZV6xx3er3iX5UoyszkMIrE4n
         thtnPbFEIgfs/jdS15LQzIS2q2G5dAl0nFZx0sYDk9iwWBVorWeU1D02CNWnVAcc/VXc
         ZK7by5mfhIaz3C0vnqdvnDYaF4nMKLhPa8IGsz1p4poOwWu2ZBS6HOdEzmUY0QiJwJS4
         RfRiqamfOPrBRbvaJ+u646JWPEn2SRsDD7WYjoxXX1Lep8nYSPUWFUXSdqg1uBa3puJw
         4Y2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718238767; x=1718843567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3mbR6XjTl+XtcpIp/RRx4D+3ymHI9xlwahgvOSA+M8I=;
        b=dsGqSOAmXCCd1dXhZagHTQCKqSYNC7tXpU4M0OElXF6PC/bCPwRpSd5vNehho+OFFH
         ZSXKiOlQMAvPn0FcNGRZtgQy8rKw4UE9x+dflohG8AiLMfiwDksHpWmjWgtcbTAhB1As
         S3t5VjDn2b/Aj+JvyRH8HnsUiVmNk6Talk5LuJ6OL26mL4xi+M5t5BlNkw7AI/eNjwGG
         HfXHuA75mwcQux9Y/HIVjLAOkZHKY9SFX7vlBIv3PI6o4LJN0JwfngXE1AQkSP/zolCk
         s11nZQsXhRJoGDoBGrVz+YXjzBC7UAB2BTFdWxAirQ6uWcO5wZsHQoJLcfdXgjOOEJp/
         bK6A==
X-Gm-Message-State: AOJu0YxuVoiPGWke6qPhGIO/H/KSUqQLKAUvH4BA7KyoBzbKoggYNvTF
	ep9mN9dVfIKwN97SWiJNy4SYII41GxjDz6vfHT2tC0K60w9+5vs2
X-Google-Smtp-Source: AGHT+IHFPjnZjBLu4CJatyVfxKESSD90OLqXHRp1aUlpSK6t2DyCI0DsxgS0il+4700/wqvrt+Kc3Q==
X-Received: by 2002:a05:6214:4285:b0:6b0:78f6:8484 with SMTP id 6a1803df08f44-6b192028b32mr38503156d6.30.1718238766772;
        Wed, 12 Jun 2024 17:32:46 -0700 (PDT)
Received: from localhost.localdomain ([185.221.23.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5f017c5sm1238316d6.137.2024.06.12.17.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 17:32:46 -0700 (PDT)
From: jiaqingtong97@gmail.com
To: zhaotianrui@loongson.cn,
	maobibo@loongson.cn,
	chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: loongarch@lists.linux.dev,
	kvm@vger.kernel.org,
	Jia Qingtong <jiaqingtong97@gmail.com>
Subject: [PATCH] LoongArch: KVM: always make pte yong in page map's fast path
Date: Thu, 13 Jun 2024 08:32:17 +0800
Message-ID: <20240613003217.129303-1-jiaqingtong97@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jia Qingtong <jiaqingtong97@gmail.com>

It seems redundant to check if pte is yong before the call to
kvm_pte_mkyoung in kvm_map_page_fast.
Just remove the check.

Signed-off-by: Jia Qingtong <jiaqingtong97@gmail.com>
---
 arch/loongarch/kvm/mmu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index 98883aa23ab8..a46befcf85dc 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -551,10 +551,8 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
 	}
 
 	/* Track access to pages marked old */
-	new = *ptep;
-	if (!kvm_pte_young(new))
-		new = kvm_pte_mkyoung(new);
-		/* call kvm_set_pfn_accessed() after unlock */
+	new = kvm_pte_mkyoung(*ptep);
+	/* call kvm_set_pfn_accessed() after unlock */
 
 	if (write && !kvm_pte_dirty(new)) {
 		if (!kvm_pte_write(new)) {

base-commit: eb36e520f4f1b690fd776f15cbac452f82ff7bfa
-- 
2.45.1

