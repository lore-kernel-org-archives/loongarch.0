Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04E91632C8
	for <loongarch@lists.linux.dev>; Mon,  6 Oct 2025 05:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759728815; cv=none; b=nsZCs8hOGPKpWY9WzbWCfut6e150RqzY9g2aI5vDJdyijP7ppfuRki1qMOnAB94NAQDfbOrwSbuUrQUi4hjujsZUOYjJgebt+WO0wtb5nrTQ7lJLhEhDb79SiIg91os1NGifsGem6iRgeHFsQ7//zsODNJ0jV0vWsAE7BBe3DL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759728815; c=relaxed/simple;
	bh=aCj1uobj4A9iKrQ+gukDvYqxxjQYE4iUxTIGfx0ES9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kaeS/k1rTusJblQ+X+nhZogpAZoRysUsPGrxeD6Kg3lHVG4e2A27GoEZan1zHha0jSjHwI3Gv0/ftSD0EZ3Os8EmGLKVEBZp6pZ4gwzT3a1vSyg8ZTYuzmVNiWUfeiI8M2EtrWx8OM1zVj3IFiW9ytoXbtQZRs/YvOfkJKJSvZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZEntWPW; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZEntWPW"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-28e7cd34047so38542285ad.2
        for <loongarch@lists.linux.dev>; Sun, 05 Oct 2025 22:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759728813; x=1760333613; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7EOwYbU9SGp9nmj94wPm5ibQSAY3d/DFo2fRn9pjG7k=;
        b=LZEntWPWk2FIdcASIKrW0E/L2vQallzm83ZWS/Uygl3MGs7kfKzG/xjukB7t+m5s4c
         Pxeb1g7T5GjS2IkzNdf44M8U1MfokfOz1XYbvehHxZBqJeWeDnDfb6KvcyYFUuIIN6c/
         EumJHRlvPNIydfAfv1FjDKzMJU6eoL0zd00z4UrrU0KtkzrdNdeCCx5+vhMK4MxOwMNV
         5NcOFekylVcFOXsAN0faA/FbSXDH595P/UzCo90LbBRtvLAaD09D3B+2tAd2Ey2pg6gB
         Ji/QfoFvFE7zJb48aNWUbYMTxv+1wGoJfchCYMXzvK0Q/8s8ZfJbnwaj7qJsgu2b9HUe
         yKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759728813; x=1760333613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7EOwYbU9SGp9nmj94wPm5ibQSAY3d/DFo2fRn9pjG7k=;
        b=tcykKrX7TNHMRW4Byn9CVR6Ao1hz6eAp797RsdwgR737pJtroFdK3PiluI21tyyH3C
         FWn3psBKfOelgh2eC8774LW1puuSICgxQjXnxLycymD6QoOSTtRrdbwEXPM77NnwjLQ2
         gumAmByYkIR+0yQZ+VFcVnMlGKpaKDx4lFJd3JdPiPVqW002KYzR7jtJ6JxV1pDirqZj
         1bptxGSDYCKQ//XUawV8jjWX2RxKr90iP7ayLR9r3xo55y91JDGVdjkFeifHWi9xq2Hn
         Lc/WvFP+kWD7P0f+03nxXTe3h4VIEclIZnEONkMNo5U1LRGyfd9/Yks6WtbWritCmx6n
         Kgmg==
X-Gm-Message-State: AOJu0Yx72dEO1qQnRa48LZbm844LZyT2svhvsOVwi5QYS7xNtID6WSDK
	YkWhy1ZU3XB1D4TAfXkRROPJ4RkhH/BigPOoeBHSWjWI03wLXQJk6tdE
X-Gm-Gg: ASbGncs1Sgj2zictLIJUY47mkjhMGre0mGAYHrVg5iCvHZAUEbHfWKxIy0buaxzDn/D
	C2sR6wO1B6x+LWICehjNyZmZNGlL0dt2XtZQDH4HJHSl6GfYBakk0TxRIlSGBJr2fS4Iw/dpnLM
	DgB1cEsKz7R4pGBZf7S2BPDVt77a19JccUugwsix9cWYulwERSE1AlksS1nE/nGUMioKobM6WdX
	2R3O6EX9pg9IhMRzYr36boswIZET1xG8siBHYaum2wrghP2O507ZYPAsSBsW8yfSHTU0l16qe6X
	UX6gjcJdMT65dbnWtTJoP8CXX0gUubCPJjPWWxM0rr5gSIEJ34JLydNwdu+iBrhRf+nCkUykxgu
	D1hSjzYJgf45lMkxJikn0XurpxVGPvTohKOlTj5O37xlXxco3aIUoM+0=
X-Google-Smtp-Source: AGHT+IGK7tHRFLUNXWefN0OzWfU0HQROuBOC+oaaZpea0hSBm4ZPyiicnupNHQ/LJPqb9rM7fPg24A==
X-Received: by 2002:a17:903:4b08:b0:26a:f6e6:ef4f with SMTP id d9443c01a7336-28e9a65e62bmr118921115ad.60.1759728812913;
        Sun, 05 Oct 2025 22:33:32 -0700 (PDT)
Received: from devbox.. ([116.16.231.215])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b88fcsm120187075ad.84.2025.10.05.22.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 22:33:32 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH 0/7] LoongArch: Add support for BPF Arena
Date: Mon,  6 Oct 2025 05:33:16 +0000
Message-ID: <20251006053323.193581-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set aims to add support for BPF Arena in LoongArch.

Patch 1~4 are some fixes and prep works.
Patch 5 use BPF prog pack allocator for BPF progs
Patch 6~7 adds support for BPF Arena

With this set, the following test cases pass without regressions:

  $ ./test_progs -a arena_htab \
    -a arena_list \
    -a compute_live_registers \
    -a kfunc_call \
    -a libbpf_probe_map_types \
    -a lookup_key \
    -a verifier_arena \
    -a verifier_arena_large \
    -a verifier_ldsx

Hengqi Chen (7):
  LoongArch: BPF: Move sign_extend() upper
  LoongArch: BPF: Rename local variable sign_extend to sign_ext
  LoongArch: BPF: Sign extend kfunc call arguments
  LoongArch: BPF: Zero-extend bpf_tail_call() index
  LoongArch: BPF: Use BPF prog pack allocator
  LoongArch: BPF: Implement PROBE_MEM32 pseudo instructions
  LoongArch: BPF: Implement bpf_addr_space_cast instruction

 arch/loongarch/net/bpf_jit.c | 305 +++++++++++++++++++++++++----------
 arch/loongarch/net/bpf_jit.h |   4 +-
 stxSxLQw                     |   0
 3 files changed, 227 insertions(+), 82 deletions(-)
 create mode 100644 stxSxLQw

--
2.43.5
