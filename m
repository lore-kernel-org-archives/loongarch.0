Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F571CAA9
	for <loongarch@lists.linux.dev>; Fri, 22 Dec 2023 14:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jkfx5q0N"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d3e2972f65so8886265ad.3
        for <loongarch@lists.linux.dev>; Fri, 22 Dec 2023 06:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703255564; x=1703860364; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zfxaQ9nW9jvx6STwaNvM2r1MNzifxGZO6uzShOeSsF4=;
        b=jkfx5q0NQJVR8YxsrfrtA5kRv5ySFWQ1ziyncjgdpXBpjImAmQSPveFZ5nkHt/Vxbz
         W6dRhqOErQopJIYTiDiUYnsi2lFagxF83kVaQIIIHBEzbt4zSMCuaTZQTCDji3vYrwHP
         /OzggMPLgJGGhYkYv4ZddIshDuDUvTUVMNkHVODY4bavLwCP+lg+HRyJ6ATMpdVtEH/I
         zQjP9fOrCzU/h1AqFMvrGtdNJ67tPmA1wVnRiDH+il42EVwZVKeu1UphyGZ+xhjQ7mkM
         soFCl1eoSGai37xUmDX9lyMqQZAazWlz6xBCY5MtWrocp07u70PzpX/QSDfEU7esptLz
         bX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703255564; x=1703860364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfxaQ9nW9jvx6STwaNvM2r1MNzifxGZO6uzShOeSsF4=;
        b=NYcJ7FSrtzQRUsEj4CJ7PNZZg7pwXIYcl46Vrx6LtztpbAWu8xZzZKGqAtHbuNl95o
         3kOoih6MF0fKEVStfZOY5mWfSxbClWEr7uiLoiwsAs0TN8y0S14Q0k2e6x3dOaXtKaTA
         8+6QuRCMt+1QZ/pFU1D4oPwFW1sMuKL/q0znEoP7sW/69gFI8i3ps81vdC+Lo0dhGUib
         abMAV7ipxmB3eopAWdu7tjQgyvGKVbSuxoT5+2JqLg517w9gOlQ1yxQn0dema0VEmiPI
         rydErVYf0dqC2Gq1Pp3csIUO0JzsBLW/VsX44G97on9RZOljsYQjkapnAMeOLYK5kjkc
         5K2Q==
X-Gm-Message-State: AOJu0Yy8fs+7UiGOoztouuMGpYE04eRN40c2ToywDsX+sxEzwcv1RTCa
	zGo9lZSFXpRlt8y6jWFyiPb9iPMcdvL99Q==
X-Google-Smtp-Source: AGHT+IHRhDnHqau/pTL2PqrJaj/lxb2MINx3ZzFZvDGHrDh1R+gseScJmri9sdoSaLjR3CC9urOavg==
X-Received: by 2002:a17:903:40c4:b0:1d3:840f:a065 with SMTP id t4-20020a17090340c400b001d3840fa065mr1170220pld.123.1703255563607;
        Fri, 22 Dec 2023 06:32:43 -0800 (PST)
Received: from ubuntu.. ([223.74.104.94])
        by smtp.googlemail.com with ESMTPSA id b2-20020a170902d30200b001d3961217a1sm3532158plc.102.2023.12.22.06.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 06:32:43 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: loongarch@lists.linux.dev
Cc: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	hengqi.chen@gmail.com
Subject: [PATCH v2] LoongArch: BPF: Support 64-bit pointers to kfuncs
Date: Fri, 22 Dec 2023 14:32:24 +0000
Message-Id: <20231222143224.54556-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Like commit 1cf3bfc60f98 ("bpf: Support 64-bit pointers to kfuncs")
for s390x, add support for 64-bit pointers to kfuncs for LoongArch.
Since the infrastructure is already implemented in BPF core, the only
thing need to be done is to override bpf_jit_supports_far_kfunc_call().

Before this change, several test_verifier tests failed:

  # ./test_verifier | grep '#' | grep FAIL
  #119/p calls: invalid kfunc call: ptr_to_mem to struct with non-scalar FAIL
  #120/p calls: invalid kfunc call: ptr_to_mem to struct with nesting depth > 4 FAIL
  #121/p calls: invalid kfunc call: ptr_to_mem to struct with FAM FAIL
  #122/p calls: invalid kfunc call: reg->type != PTR_TO_CTX FAIL
  #123/p calls: invalid kfunc call: void * not allowed in func proto without mem size arg FAIL
  #124/p calls: trigger reg2btf_ids[reg->type] for reg->type > __BPF_REG_TYPE_MAX FAIL
  #125/p calls: invalid kfunc call: reg->off must be zero when passed to release kfunc FAIL
  #126/p calls: invalid kfunc call: don't match first member type when passed to release kfunc FAIL
  #127/p calls: invalid kfunc call: PTR_TO_BTF_ID with negative offset FAIL
  #128/p calls: invalid kfunc call: PTR_TO_BTF_ID with variable offset FAIL
  #129/p calls: invalid kfunc call: referenced arg needs refcounted PTR_TO_BTF_ID FAIL
  #130/p calls: valid kfunc call: referenced arg needs refcounted PTR_TO_BTF_ID FAIL
  #486/p map_kptr: ref: reference state created and released on xchg FAIL

This is because the kfuncs in the loaded module are far away from
__bpf_call_base:

  ffff800002009440 t bpf_kfunc_call_test_fail1    [bpf_testmod]
  9000000002e128d8 T __bpf_call_base

The offset relative to __bpf_call_base does NOT fit in s32, which breaks
the assumption in BPF core. Enable bpf_jit_supports_far_kfunc_call() lifts
this limit.

Note that to reproduce the above result, tools/testing/selftests/bpf/config
should be applied, and run the test with JIT enabled, unpriv BPF enabled.

With this change, the test_verifier tests now all passed:

  # ./test_verifier
  ...
  Summary: 777 PASSED, 0 SKIPPED, 0 FAILED

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/net/bpf_jit.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 4fcd6cd6da23..2f154c60ee00 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -201,6 +201,11 @@ bool bpf_jit_supports_kfunc_call(void)
 	return true;
 }
 
+bool bpf_jit_supports_far_kfunc_call(void)
+{
+	return true;
+}
+
 /* initialized on the first pass of build_body() */
 static int out_offset = -1;
 static int emit_bpf_tail_call(struct jit_ctx *ctx)
-- 
2.34.1

