Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9434B6137
	for <loongarch@lists.linux.dev>; Fri, 27 Oct 2023 06:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONWtwqYC"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5859a7d6556so1513965a12.0
        for <loongarch@lists.linux.dev>; Thu, 26 Oct 2023 23:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698386465; x=1698991265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ajH5Why6tK/hgiFX9v98XyW+N+EsawtY8k6RA/o7xr8=;
        b=ONWtwqYC+5R8ekZsYOobISmmiqAGgLeopLvHlKrfHos+HvldJ+5iAXuw3NyLc+R8KT
         MtSS8p7J+aHGHxxflTM/rqzKnJvpzdqdvZSq/IsL00Fh+agLkRPKj+TnrSv8GVIj4ym7
         M2Dt0VwqHz/P3wilcPqSR4qRDtA3jMRT1PwzStUjbtMs/775SjeN9u1RgISTMj7T/dNE
         wHnWHWAYz/+vnNKqMJ/zekH4Tcn/2lT7FqTSAp7ymYok1DzxAR8uZM1PrUaPmTJUW2VH
         Abom4o2+9dNTQR0Bc4rc1N3N4YdxEJs+APO0trfZZ6uPKfQS2IP0kWq4EzQgzgCIsHnp
         /MfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698386465; x=1698991265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajH5Why6tK/hgiFX9v98XyW+N+EsawtY8k6RA/o7xr8=;
        b=LV8ymbZq9Xl6qsKOUwJDPbofwHS0H1Czq1MZMUudBlY7w/hEaJeB834/1l/cH3E1TZ
         K7NXi/2h9pfI/ZC7/8tGOFboQq5BvlQWENOjNZbq4Yff3iAdk1251ImSHtUlYAKncFKI
         AiM4+E1SAanp4VDk/Jr8vLrWBtsyK6Rnth0C3vX8Wl2XTd29TKZyOOvlSYo3ERQYvyUQ
         NKyjj3/V8csYFoPFUJgLaj+mptFDQThFHkTo0hCisrf565669iZoSFJQoUen561Zg6SK
         +QUuGsazFM8lQkWbiAxtda17ETpsYQRWtyY0VxZ8c+CNU1fZHZ3WZtqUqbDUFbM3cND7
         Uv+g==
X-Gm-Message-State: AOJu0YwxxDP1jDz4uC7VvprRStZwvIMQkfxgcwb4gYLJea/Xy0on4m5c
	bDR+mJM6b+vwCJZs0lHFnK1NB0MzyeLbOw==
X-Google-Smtp-Source: AGHT+IHOweALGGGzNW5IfCHZvYctz11Ua6jUkpdtKnAq4NlFLXIr0OlxPqnBeyhcq63cvV/knoxAoQ==
X-Received: by 2002:a17:90a:f686:b0:26b:e27:8bc2 with SMTP id cl6-20020a17090af68600b0026b0e278bc2mr1653779pjb.45.1698386465039;
        Thu, 26 Oct 2023 23:01:05 -0700 (PDT)
Received: from ubuntu.. ([43.132.98.47])
        by smtp.googlemail.com with ESMTPSA id z2-20020a17090a1fc200b00277337818afsm1113667pjz.0.2023.10.26.23.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 23:01:04 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: loongarch@lists.linux.dev,
	bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	yangtiezhu@loongson.cn,
	hengqi.chen@gmail.com
Subject: [PATCH bpf-next 0/8] bpf: Support cpu v4 instructions for LoongArch
Date: Thu, 26 Oct 2023 18:43:29 +0000
Message-Id: <20231026184337.563801-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patchset adds support for cpu v4 instructions for LoongArch.
For details, see the proposal ([0]) and its implementation in BPF core ([1]). 

  [0]: https://lore.kernel.org/bpf/4bfe98be-5333-1c7e-2f6d-42486c8ec039@meta.com/
  [1]: https://lore.kernel.org/all/20230728011143.3710005-1-yonghong.song@linux.dev/

Hengqi Chen (8):
  LoongArch: Add more instruction opcodes and emit_* helpers
  LoongArch: BPF: Support sign-extension load instructions
  LoongArch: BPF: Support sign-extension mov instructions
  LoongArch: BPF: Support unconditional bswap instructions
  LoongArch: BPF: Support 32-bit offset jmp instructions
  LoongArch: BPF: Support signed div instructions
  LoongArch: BPF: Support signed mod instructions
  selftests/bpf: Enable cpu v4 tests for LoongArch

 arch/loongarch/include/asm/inst.h             |  13 ++
 arch/loongarch/net/bpf_jit.c                  | 143 ++++++++++++++----
 .../selftests/bpf/progs/test_ldsx_insn.c      |   3 +-
 .../selftests/bpf/progs/verifier_bswap.c      |   3 +-
 .../selftests/bpf/progs/verifier_gotol.c      |   3 +-
 .../selftests/bpf/progs/verifier_ldsx.c       |   3 +-
 .../selftests/bpf/progs/verifier_movsx.c      |   3 +-
 .../selftests/bpf/progs/verifier_sdiv.c       |   3 +-
 8 files changed, 137 insertions(+), 37 deletions(-)

-- 
2.34.1

