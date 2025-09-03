Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CC42FAC1E
	for <loongarch@lists.linux.dev>; Wed,  3 Sep 2025 12:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756901165; cv=none; b=bdpIXF97d55RxPI3mtOu6PtwmQaNY72VLoZeNgV1jsDJPi+HjFPqrUS7LS/1H6FN7usp7XMUKrwOFjJ8F+5BvOAW8vfznfnVRXILq+ARZjpSctXLqNaB0l8mPd3AwkfAszc00MMmQ/arn8H8Ejf4Rzwhw8+Zxonwd5uZBOr0X5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756901165; c=relaxed/simple;
	bh=PpVmgWHtlHzTEWSzjqMsLMqVS2NTZDJvoWyT+mQ6KRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s9cAD0OVKqHbNKlxxxT/jpnDRr3UHVtWI64oqG8IIYHT0DT2hJPc78AYb/8SHOKrzedbvuhxSrJ+G67lzMBTJkYNj7UR/JYrC0CKcORDuSBWg58WcZ922BGlTqKqwEVNRhyw5DWCC0llb4y9q0ElQC6Chrg6zRItIeX19WLqJPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQh7Yfd3; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQh7Yfd3"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so880950b3a.1
        for <loongarch@lists.linux.dev>; Wed, 03 Sep 2025 05:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756901164; x=1757505964; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i79mMmWi1o5Jhs2l3W0//QPGmkXUcAOe3z/upCCt3A8=;
        b=SQh7Yfd3Lv5oP8zWQ91kouza0Nr2Oz+6NZ/68n56x7y3lyHOhYik20/Akxfu0IqLB6
         LDDsTyDdI4rQRDn0XaULpatavpz6+VF5s32PW8UB1Sulcxx9VaeS57Vg4e7TTfEQf4Yh
         cgkrnPTvTkkiVPxNRwcIhd9C6sqRbXu5bvMiJjZINH4UlgC7FYCQbXt6BhBSSjdiBubY
         RajEMZWAOMmj1mn3xC5N0KgOfOlOpY2BJTExOTKK0wat8lYCpWmRIq2ormqBr9IimAEC
         7BtCgUpN9w7X5tk7JucqC2rRLFVo8L8yhC2olGwhRH43//tbz2P2EZ3omaLdK/He8jtP
         jgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756901164; x=1757505964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i79mMmWi1o5Jhs2l3W0//QPGmkXUcAOe3z/upCCt3A8=;
        b=jKAWqPXbrf04+5VkMHk7Pxj+kJTRldpVq+a5I5kq+aZI07KhRprYJeY0xbPFHNc8e6
         WbEkjjCmgAUSfj17B3gYHq1gn45Pge3/piFiZekXQfxJffWrhfajfqBXQsKklq8VKvbZ
         lf0g7hKnOLlkJRT4XCQLAjR4KJRvRu7LiW1SWoazr0IV59nz9/QhE8eUyAr7zgqeiYPf
         T+U98BRKYAaE7F/dOPDVGSmLqaPCjDNRph6QFpvfsp6VCNA3rjpxOLeND1+qJ+2HlVQd
         BAiTWvNmGouUMGGR8k9MPTMb7CSOqWlYaViHpQoA5UVTjJ/3Jnf1RDHfx2du3zMhAu+e
         O69g==
X-Gm-Message-State: AOJu0YyjWn7+d6/06tiN8s5TmqoCt+jCW6MH45S5jXLcn9g0AMmxLOyj
	OQAaWKurZEHs4/HQEXe7ozjM84m6T+4O86M6sK6U2D+2jGqwRg+hs7TE
X-Gm-Gg: ASbGnctFbiOymUb/eY49LC67tAjE132HPaxhy9maq12Nq8RS433d4EkVMm+dNsBLCC5
	4uhsIjKnENeioxQzzLbz0uPSZbMhwsAQiEQrvrK9j99e3gSIccuc1uWOCi4qaNg4K/6UdzcxoGB
	rF5pUDsAhI3R+aLHhkyitYI1S6Eb0dBT7bhW7RXLeSNsxJN0SD/FevuhhdPJhnkzHNXfSjOxDaj
	XkpA/mzIj2IhfbEoPKN1CrWa51+1i2aFw+lzus7PD69kOre/jYA9e3xvciOtp02u8qm5TKVa2As
	WFjUhA93eAf9syDSKpRkqkKhBwdXD3tFiyK9RvsyH80Ed7+zXWcN/o30efYcAPvFuYT2g4pcGGb
	BoC8CnPCBp2w2YJCpjf+fHWlHRw6hS+nqrh1smHpU
X-Google-Smtp-Source: AGHT+IHGbnOJk18bUwBHacTOhmiIU31YcL3OajmhbJ5I+4pPssQpYpN/NF2+xMZn6DOP0Zn2or3RfA==
X-Received: by 2002:a05:6a00:2b86:b0:76b:f7da:2704 with SMTP id d2e1a72fcca58-7723c503bc8mr11722818b3a.11.1756901163417;
        Wed, 03 Sep 2025 05:06:03 -0700 (PDT)
Received: from devbox.. ([43.132.141.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a5014desm16615899b3a.92.2025.09.03.05.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 05:06:03 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	hejinyang@loongson.cn
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v4 5/8] LoongArch: BPF: Don't assume trampoline size is page aligned
Date: Wed,  3 Sep 2025 07:01:10 +0000
Message-ID: <20250903070113.42215-6-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903070113.42215-1-hengqi.chen@gmail.com>
References: <20250903070113.42215-1-hengqi.chen@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, arch_alloc_bpf_trampoline() use bpf_prog_pack_alloc()
which will pack multiple trampolines into a huge page. So no need
to assume the trampoline size is page aligned.

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 35b13d91a979..43628b5e1553 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1747,8 +1747,7 @@ int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
 
 	ret = __arch_prepare_bpf_trampoline(&ctx, &im, m, tlinks, func_addr, flags);
 
-	/* Page align */
-	return ret < 0 ? ret : round_up(ret * LOONGARCH_INSN_SIZE, PAGE_SIZE);
+	return ret < 0 ? ret : ret * LOONGARCH_INSN_SIZE;
 }
 
 struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
-- 
2.43.5

