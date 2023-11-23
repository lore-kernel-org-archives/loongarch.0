Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F55221117
	for <loongarch@lists.linux.dev>; Thu, 23 Nov 2023 15:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gq5aT+jx"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1f937a7b8aaso562073fac.0
        for <loongarch@lists.linux.dev>; Thu, 23 Nov 2023 07:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700752342; x=1701357142; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ppW4DoglJ3C/vPddz2/r1J5r1r+DkMQSG8YfnSPIn8E=;
        b=Gq5aT+jxChDmEwV4bSiMaMZEhhpR0JCmKOG08DcQjgLmXLTHhzjHMXeopRni/fgyU0
         cAypN+SXu3L2gBCnbiuC+/lu9MR05CkHNZrdAvYZc7dnEgmsvFiAzNzCaOzRkxKhzlYX
         W/ryTLJtjU0tX4dpIWRsj53gPcu8du2g/DmJbIbZtaizcYHAuTIc1kSSbh8OR3LjrmDE
         Lpg9EsJ7wVpSXtHO4v0jN70+L9of0WvfC/t26VyrAELJHySdGWUzp2zLZkKydm1DPVGm
         JdWYIBtIYSBCAZMWcvUul9ec/JKbx6lTyAiBe93ZvBYj0j4aaMG/XO07LoOsYULexpO6
         dPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700752342; x=1701357142;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ppW4DoglJ3C/vPddz2/r1J5r1r+DkMQSG8YfnSPIn8E=;
        b=tWL/TRUFA24wEdnl4iyhw72PLqEulX9nN3z+8PFJMUerxTiSApTcFTJ0NoKCY76vf/
         NZzlowPJbRGUToH95Pfr2SpUBtwyduDk1r7bJ08Lw6uESQ1r4eG/S3DBmp0iM4myjZ2m
         FDXS9NVMF5UUUzfI5HkwfVtqZVieeBa4UmLdpSmyBmGhsxCQ19/GjmA6OnKZ7DQA9iV2
         Y7ZJ0OPZEGezN9rYLf2l57q6tL6FM+bMXp0Bkt0k7M7y3HvFrqS/r4pgxn4vOE2soto4
         uot9T8TzTEtLj7b1s2Hs+RX8fr0KCDs2NeaaEWolvuFaE5gKuhIouCVekPmgqi2DZWtR
         vJfw==
X-Gm-Message-State: AOJu0YwteyaMZeMVcYGI6Jtq2NlCxTusG/Jx5gs8zB7jxWVu1CwuNZLM
	P6C2v8mTlJPQXB/3/qjHMeGA65503baLwflUMFEUUyejKPSWDA==
X-Google-Smtp-Source: AGHT+IGtJSmWED/DRpx6rYmqst6hYpoSnqN6v+30IeY8XZeDaQEdDM5uLPsokmqQ1+5xua94zACFBHecROFsYyaZPjw=
X-Received: by 2002:a05:6871:e70d:b0:1e9:d158:7e85 with SMTP id
 qa13-20020a056871e70d00b001e9d1587e85mr7952779oac.30.1700752342152; Thu, 23
 Nov 2023 07:12:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Thu, 23 Nov 2023 23:12:11 +0800
Message-ID: <CAEyhmHT6UOryPZi7eEfw01Y_CjAqxy8NM6eKkdvdojJqB9P7eQ@mail.gmail.com>
Subject: Kernel panic and stall triggered by bpf selftests
To: loongarch@lists.linux.dev, Huacai Chen <chenhuacai@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello,

The following bpf selftests tigger kernel panics and stalls (RCU related)

| TEST CASE               | JIT    | JIT + UNPRIV |
| cls_redirect            | PANIC  | PANIC        |
| sockopt_inherit         | STALL  | STALL        |
| test_profiler           | N/A    | STALL        |
| verifier_map_ptr_mixing | PANIC  | PANIC        |
| verifier_movsx          | PASSED | STALL        |

BPF JIT can be enabled by:
  # echo 1 > /proc/sys/net/core/bpf_jit_enable
unprivileged BPF can be enabled by:
  # echo 0 > /proc/sys/kernel/unprivileged_bpf_disabled

For the full logs of each test cases, see below
https://github.com/chenhengqi/public/commit/75a265e961e5d93b61c3b012e16f1db2f9d333b5

I spent quite some time debugging this, but unable to isolate the
related code path.

Thoughts welcome.

--
Hengqi
