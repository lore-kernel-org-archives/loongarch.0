Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D637831597
	for <loongarch@lists.linux.dev>; Fri, 15 Dec 2023 14:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBYQfsmv"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d3448937ddso3355105ad.2
        for <loongarch@lists.linux.dev>; Fri, 15 Dec 2023 06:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702650115; x=1703254915; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TWWjZ+qFQ8pFkoI3jUknmtz/usfVHWhhyfDnr4D5VyY=;
        b=BBYQfsmvEMNo4H2H3Xy2pNQnuwUC78aFkAz7OzlODPV6myAfzspKJXB+xEyCtsYFQa
         +n2hKcfzcdPlXxZyjXR8Prg6wSrCaT+TXbwNyPlatg9ljGsr0YmzQA9JR7NnlgtjrkQz
         fkgl7as5u+flzsFE0QgUaF93kT80i/a/EWW4DDS151ZLpyMWV1pVlwRBQ+MBUEfD7vdN
         JEe/hgmqPH27U1X9WUf/lBQfxIGY24lzastHRREnd8h5a8Bh5o10GqYdH68NnCbmR+bX
         lyejRlTkU3wfa0rkUZ8kGhMA/t4wDPWk57HuTuT1MS5rdN7tPu8uQ9aaUwbpDoZyNckN
         Bz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702650115; x=1703254915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWWjZ+qFQ8pFkoI3jUknmtz/usfVHWhhyfDnr4D5VyY=;
        b=wtfIxCMPX/lCjQFPoJ+swYV+eBgfou4xT2JqOj2sEesNn5gQe249IIBbRkkJIRBKgY
         t9GnecP1tRUw46l9mAesaMWcKL0SSFbZp9YrtmezmOlDgPAOfYCIWIr82m4kqJA5GaJy
         wdC/f4Vzoz0o3LwYYIBXUT98PNUeSETmCZauuQfWhlihL/27947CmjJNiJ0EcQBC69Nm
         x4r423UNJXaf+b6B3l1fJv5o86+kQGstyx3nuzGgJfaCKvzIhz1n3v9e4EPlF84NXgk0
         UyIKZX/JDC5NdlBYPkIuvKxks9Z85T/+Ng2lIjbs6qTbimvqBiuyboZ+JUdJKDKxfuwt
         fDlA==
X-Gm-Message-State: AOJu0Yzt6aDdBCWL0glOqzagEiQdzZDsMX5RZg+Voj6GqQJirxPnaUlJ
	XhZUprVDOBXAmgFpo/s+su6Lu9umQcTmvg==
X-Google-Smtp-Source: AGHT+IGHageZJrCdM/ONavyJgz8Iu3Rs0gpZ12giSp7il9L9c6AlA1qgs8MAjodCo7NklsWIUqOZWA==
X-Received: by 2002:a17:902:e843:b0:1d0:9979:7bd3 with SMTP id t3-20020a170902e84300b001d099797bd3mr8143398plg.16.1702650114747;
        Fri, 15 Dec 2023 06:21:54 -0800 (PST)
Received: from ubuntu.. ([120.229.73.10])
        by smtp.googlemail.com with ESMTPSA id jb18-20020a170903259200b001cf96a0e4e6sm2413521plb.242.2023.12.15.06.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 06:21:54 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: loongarch@lists.linux.dev
Cc: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	hengqi.chen@gmail.com
Subject: [PATCH] LoongArch: BPF: Support 64-bit pointers to kfuncs
Date: Fri, 15 Dec 2023 14:21:38 +0000
Message-Id: <20231215142138.3281-1-hengqi.chen@gmail.com>
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

  # ./test_verifier | grep # | grep FAIL
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

With this change, the test_verifier tests now all passed:

  # ./test_verifier
  ...
  Summary: 777 PASSED, 0 SKIPPED, 0 FAILED

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
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
2.27.0

