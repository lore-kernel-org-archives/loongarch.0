Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405B42D9481
	for <loongarch@lists.linux.dev>; Mon, 10 Nov 2025 17:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762797227; cv=none; b=ujsx+K957oOYuxg0FFfuQ5gc16F68O97mmAevN79DDZKhMtVMUS6dAk2Ro4iJe6NpaerHUonQMjqZGzblZYF+fAi1fnojC4I5u88XN4TtZA/SqtFJzYDIPuZSkSMdUPCXwPYVFHK2yJpqbmaqo5kbVzmXGJFF4IgVQ557gRLwJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762797227; c=relaxed/simple;
	bh=4B09DQRWmkSD4e2vpc/JMHmkNe6HHY01bx8UxeA9kDU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ncmVSR9ABTwNDFJgZZRg2BBcYMnrvl7PO7f4RHKflFnLlLSlSN2M48Z2KQRTRIpiFPKxoYVj2NveM+27yPj6ClbZdIQlRThtwIh6WHZrdJY9DOa2xBvYEPTAp1IhFU8X7Pq94qhgF3MZndxLp1wS+bc6vHu8tlTHeQvK/Dee4gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AnsX3U7e; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnsX3U7e"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7a59ec9bef4so3644899b3a.2
        for <loongarch@lists.linux.dev>; Mon, 10 Nov 2025 09:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762797225; x=1763402025; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QzqX/Bymcdd+4CECGYgS8MWRW/CXpvPBt3lGGZ11o7c=;
        b=AnsX3U7eCJ9Lmx6vJZ8iFYq6qJVU2G22+/1CY01TSeXzHBfMEMSwKVSV1fHPd6KJEp
         o3LGwY+Zvj1khlSuxLQZ+RXnYeFXnQgpA/VN9IhgsYD+wqe90WPniZOhfVRe4W/WeXmn
         G0BroLlqKdUVGUHfeHAQL5ZTAhp0eOT81osK0/43LIhKn91lz3ChoKOSJ50lwNZoSV/c
         XcAYUAQFNkjMofMKhzF1gaVPBUyMak7RewAmWvwjJ7qzH6e426WcsYU4/qHmTnNfd1C1
         f3XpMFOHtS8Eu7Tg56m9otfED+h0ItTedr4mwu/G0hnpSwDxMJBt74FB6W6uaJGbXF5t
         /9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762797225; x=1763402025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzqX/Bymcdd+4CECGYgS8MWRW/CXpvPBt3lGGZ11o7c=;
        b=Q1FbVfIIKovZSKyv28f7FCiNRtvSNVWt8HcTiA5bgSsVgVUmn4/5HfXFNccLiRak7k
         h/YDK9kuWD5dwqyh4NQ8mFCiP4rFSQeK5NQk0C35zlhDSV1vnlObQvWDvMI8Pax3WL5D
         OECZBEBEmiaw+ahMjQ+bQR3oGYnoZZr+nnuleo915JiDngyF09Na0L1fL7j1MMM87YKh
         1ZtoXYqjKrYVKjprYYSSwg0dK/46CImtyPSxzkz2yJD0BSU7212msMRlGHoInRKQOPVf
         76x96531gxBDN3rpzJywTU1dCMPL23ZFmsIwWZsFSISHF1BPKXGRJbxh8u5zOCUEXqg1
         GPOg==
X-Forwarded-Encrypted: i=1; AJvYcCUgAsuI1wAV8Bt2s73dCfYXfsWLgoQe0hnNBzQbGisY+DT2HPFNqL0Gn0Untgu3Z8o+psheLn/GTu8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/ET+DERs9ySxAPu7l9O9/f+wLqJIIM/Y7UQBsTWCEKMEy0rmi
	v9B4aSZpKBBH3jutj7L0vSqMzLDoJKPrxL0qpeuJRZusoFbINofzji4B
X-Gm-Gg: ASbGncs1S4feo8whOsXFjEB4+Qd5jJ0IJqr9iKb43LBd/5m1BsDQCWAXkDiOfAwXYoK
	ZiEsIFrI7cNTsB+sf7Au/l2BoDa9ffNhbiNHPUjicyFLw9X+J2Fi7sDpGmaz7DIHKRKeYDhqlH+
	Ie33dxBf30hb2zS1wYSkjWJMz8Yz/fn76beqWXu/HUoDGBQinWTg3GfDorTW8BzkhhYB6sLA/to
	ViLtPJ0fHeR5vqn507KgaaW3Emufv/K3DmsEI4m/ALvuqAez9hAU9KPLCimd13e72O6Iiuzmzjs
	hwhXKX8amdRpN7Hcx/f8COAH/iPd7/LOhTCUfxoXArXFui7Hs30l1oOkbZSYE3whwXbnzcSAnF2
	JTsX6bcCDj0GjlwLz2R2316Pjtx1058a+p+g+cWh4A5AThW1ElP8dditb3KxdkrgRW3Dku+iOhs
	GnjtkuWuKQze/LKOjNlZ7jrlZRfiRXrwU=
X-Google-Smtp-Source: AGHT+IFFNYilHm0Z2d/QlucupXMOX5PyD6V+cL+fkVSJ1b/o84lJ/uL54M3JQ5g+YJGL4e4cn4SsNg==
X-Received: by 2002:a05:6a00:185:b0:7b6:1c9b:28e with SMTP id d2e1a72fcca58-7b61c9b0d65mr278984b3a.14.1762797225342;
        Mon, 10 Nov 2025 09:53:45 -0800 (PST)
Received: from fedora.hsd1.ca.comcast.net ([2601:648:4280:48f0::76e1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c953d0a6sm12428751b3a.12.2025.11.10.09.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 09:53:45 -0800 (PST)
From: Vincent Li <vincent.mc.li@gmail.com>
To: Chenghao Duan <duanchenghao@kylinos.cn>,
	Hengqi Chen <hengqi.chen@gmail.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	loongarch@lists.linux.dev
Cc: Vincent Li <vincent.mc.li@gmail.com>
Subject: [PATCH] LoongArch: BPF: Disable bpf trampoline kernel module function trace
Date: Mon, 10 Nov 2025 09:53:30 -0800
Message-Id: <20251110175330.73200-1-vincent.mc.li@gmail.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current LoongArch BPF trampoline implementation is incompatible
with tracing functions in kernel modules. This causes several severe
and user-visible problems:

* Kernel lockups when a BPF program is attached to a module function [0].
* The `bpf_selftests/module_attach` test fails consistently.
* Critical kernel modules like WireGuard experience traffic disruption
  when their functions are traced with fentry [1].

Given the severity and the potential for other unknown side-effects,
it is safest to disable the feature entirely for now. This patch
prevents the BPF subsystem from allowing trampoline attachments to
module functions on LoongArch.

This is a temporary mitigation until the core issues in the trampoline
code for module handling can be identified and fixed.

[root@fedora bpf]# ./test_progs -a module_attach -v
bpf_testmod.ko is already unloaded.
Loading bpf_testmod.ko...
Successfully loaded bpf_testmod.ko.
test_module_attach:PASS:skel_open 0 nsec
test_module_attach:PASS:set_attach_target 0 nsec
test_module_attach:PASS:set_attach_target_explicit 0 nsec
test_module_attach:PASS:skel_load 0 nsec
libbpf: prog 'handle_fentry': failed to attach: -ENOTSUPP
libbpf: prog 'handle_fentry': failed to auto-attach: -ENOTSUPP
test_module_attach:FAIL:skel_attach skeleton attach failed: -524
Summary: 0/0 PASSED, 0 SKIPPED, 1 FAILED
Successfully unloaded bpf_testmod.ko.

[0]: https://lore.kernel.org/loongarch/CAK3+h2wDmpC-hP4u4pJY8T-yfKyk4yRzpu2LMO+C13FMT58oqQ@mail.gmail.com/
[1]: https://lore.kernel.org/loongarch/CAK3+h2wYcpc+OwdLDUBvg2rF9rvvyc5amfHT-KcFaK93uoELPg@mail.gmail.com/

Signed-off-by: Vincent Li <vincent.mc.li@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index cbe53d0b7fb0..ace89ca95f9b 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1624,6 +1624,9 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 	/* Direct jump skips 5 NOP instructions */
 	else if (is_bpf_text_address((unsigned long)orig_call))
 		orig_call += LOONGARCH_BPF_FENTRY_NBYTES;
+	/* BPF selftests module_attach failed, disable module trace */
+	else if (is_module_text_address((unsigned long)orig_call))
+		return -ENOTSUPP;
 
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
 		move_addr(ctx, LOONGARCH_GPR_A0, (const u64)im);
-- 
2.38.1

