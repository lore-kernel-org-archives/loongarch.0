Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269021;
	b=ZA3d6ATPzou+wvdJOl3doFORR0IpnAsil9yu5y+jT1+T+ICpstOZT7hddXArjpIvvt/C
	 meL/33xaLlnSwZoGofl6vKm0dvzgr/HoFgIp7++3t3KhxIJlpxcMWJhmkIcirA9aiqfRU
	 QIbIfe00nKQKMJ1ApxQQMwMbrT0rK37UumXXu5OvNhhLdcAI+vfBc2RxIcA1IUnTEkrGa
	 8xDw4xK3NCDMTKXDPv5nSDYgzmroINX4261GHe4lQQXamsLMiM4vAS0KjGGrl7S8EAdC4
	 4Vn8YMNljwSlj8D19YX8Doa0Cz8JV6gPOl1RcHCUUOJCf3BCPFryEKeolVwei+/mlOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=A1ekNc0B2q5hqHVaqyrrPmobu/u9RVnhuIQihIy7wRk=;
	b=yEpz/KZSULFtitk/OZqlHpnfnpIKE7GOzBzbOPAJ6BD7IxOuk9+byGbwJsySduqh+EUn
	 WT/Wgrul9G/bwgGKeIZLWoy00RH9Gfw3JFpiLbo/x2XKvKf9H8h6us0PNCdeQku9uP19Z
	 pOuCojCdx/KJc+8xzaRujuaghbqdB/iyDQNU6LwOfRAHT0M5lJgGbZpWTE102D1yfJb/Y
	 4QR23mYKSVF4xotmGvKMw4xLogAZH8Fuf0wVk4rFIrmmoys2sbQMAqWuxrkdzv5W9cseD
	 vD1Zz5xQZU+piAe4kmGWaWFoqmrKNvN8vCR8gOzJvzt84PVgbkDaH7+0hlJxuLQ1jEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Rk0wdJ/e";
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DE0606A332
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 00:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33DE0606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rk0wdJ/e
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-716c0217635so1240091eaf.0
        for <loongarch@lists.linux.dev>; Mon, 09 Nov 2026 16:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794269020; x=1794873820; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A1ekNc0B2q5hqHVaqyrrPmobu/u9RVnhuIQihIy7wRk=;
        b=Rk0wdJ/e+JY70794MqDFedh7gDf0mdhuWwPgbXg5R4Lb/1M6fe0gyFlsCu4FlsJS22
         ZKM9leuKkOb0ElMltUxWNNLCBsY4PmqHQpF71nW91yIpoaMmYMTVSqdi6lLMTCSIxVjz
         1XEB1G1As3IuTv3rGsiLI6tWejNTvYcPoZkyiqqx3yT3p/hHm+s4BOfszGzYXRjlGS//
         My6oxa4YDX+k5PMT2LpgBIPS4Tw71j3krsSYQgyBPPanKesU7GHx2tWA2q1KczRx8pYm
         22TEfqlwyfW+IUhyTTc0i5+s+uRUVj4pDvgF0eK2jonPe+eD8HAtkfI6wYQi2t35oUQY
         +XOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269020; x=1794873820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A1ekNc0B2q5hqHVaqyrrPmobu/u9RVnhuIQihIy7wRk=;
        b=wuRQD6BvqvO4+dYt54K+c69PLVrlGVu46G5HqecUfrAgbz+thFXMHj68wNZ2Sv3h3q
         e2NNTnV9YeGkY293iL50yCSrwiU2eHl70w5rrHA96Nlj7iP238asZsa7zASfSli7TQXA
         o0/hbihGm1yfLq2lZDUm28otUmHnqdWBgmp+RQp0caf437KKxQTksujyVPjnHy5S/Uge
         LtTpaJ+mUoeqPJHWuWQrBzq5dM4xfgHX3MwQm/2PCYZXqpe4BSy6Unujw/Uf0GY+u0cq
         VS7v/0nsxZF1zX4apKWfqxlQoic/QiHk9pvq1VRisz7aAVWZnwLKTgs+LOzQGyOyXNDj
         9k6Q==
X-Forwarded-Encrypted: i=1; AL+hErEbwflIEX8wsKPAQOVKhEqgJ8iGb6BM645lOgYDFhH844E1RhkZkhb8mV6kR9pAIZ8kal/9hyvjSqY=@lists.linux.dev
X-Gm-Message-State: APuU4Z/5xl6J4xTNSdSzO1PZnX1BbfNFWtkc91MU48Z1YVruOjflWwXP
	1L+XAlGfS8qxaygJOS2/MxKeL5cCaF/1hEKvoYkXALrJjMU/8cBHi7VH
X-Gm-Gg: AYBFou1yqMxpDS/5ZX34qoUAO0X1IwElaJsp36d13rRyeUixU0oPL21qcC+OPhuSlli
	FErae1nZOuNJtIWdpZreLi5CuzDVNYy07nlxWQlLyg5BZZyd29dNX0th4aBarhyjhY/TWCLZKcC
	nbHDkdYAF6AZCUc030I+ec42gm2NNnZlKnYkT3+1Xp8C6fLkGEe9pYbYOubfEuKEbBngflkrYuv
	kq1I/zwU9a81tpeWncXw4ZNiCfikfZEOxge31aYCcd/luD0fiFO8X5/4c374xpLYuSG2mj9RKtH
	wQcHEK6J6bPTddsnw1GYG0FTpxB3JOjUH3IF5648P/rJ54pcf72uE+lgNx/2Tf+fa9G4ulveCfJ
	JQMugo98FKG3YpjGxRbVpN5yY9aN5bibnOosGqpeETQXDzu1IbqtYHTwXGuNVwy+U12R3R/y+2v
	qbywDzRPaPIr/9Q2G6JjyTvtnW9n+pFl2NRw07RbMTrshELsn2HoSdqYo5rU67rqJaSV+y+95lG
	zh6jz7M4m6SiKdnF1aFEr7FGCtyiu8iW/7WGPezQ/WJFSoRbmD6w2nM75u/OXUE7cK2X71Lsho8
	vrethiVAsD0ZjlJffjR15S9ICw2DIwYayRAPwr0UzeplDiUSRaaoyDaySRGpboGf
X-Received: by 2002:a05:6820:a711:20b0:716:e9e0:542e with SMTP id 006d021491bc7-718a528656cmr220220eaf.12.1794269020089;
        Mon, 09 Nov 2026 16:03:40 -0800 (PST)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718aa03dbeasm513036eaf.12.2026.11.09.16.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:03:38 -0800 (PST)
From: Leizhen Zhang <lzsx618@gmail.com>
To: jpoimboe@kernel.org,
	peterz@infradead.org
Cc: yangtiezhu@loongson.cn,
	chenhuacai@kernel.org,
	alexandre.chartre@oracle.com,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH 0/3] objtool: Fix undefined behaviour reported by UBSan on a defconfig build
Date: Mon,  9 Nov 2026 18:02:52 -0600
Message-Id: <20261110000255.1720945-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An x86_64 defconfig build of v7.4-rc2 with objtool built with
-fsanitize=address,undefined (GCC 12) gives two UBSan reports from
objtool, both on the normal vmlinux.o pass, no unusual input involved:

  arch/x86/orc.c:11:18: runtime error: member access within null pointer of type 'struct cfi_state'
  special.c:84:18: runtime error: load of misaligned address ... for type 'unsigned int', which requires 4 byte alignment

1/3 fixes the first one: init_orc_entry() takes &cfi->regs[CFI_BP]
before its own "if (!cfi)" check.  2/3 is the same pattern in the
LoongArch copy of the function; I compile-tested objtool for LoongArch
but have no LoongArch object to run it on.  3/3 fixes the second one:
the feature word of a 14-byte packed struct alt_instr is read through
an 'unsigned int *', so every odd-numbered entry is misaligned.

Testing: I relinked vmlinux.o without objtool and ran the old and the
new objtool binary on two copies of it, with the arguments Kbuild uses.
The old one prints both reports, the new one prints none, and the two
resulting vmlinux.o files are byte-identical.  A full rebuild with the
patched objtool is also clean for objtool.

None of this is a security issue: objtool only processes objects from
the build itself.

The two reports were found with UBSan, and the analysis and fixes were
prepared with the help of an AI coding assistant; I reviewed and tested
the result.

Leizhen Zhang (3):
  objtool/x86: Move the cfi->regs access after the NULL check
  objtool/LoongArch: Move the cfi->regs access after the NULL check
  objtool: Fix misaligned load of the alternative feature word

 tools/objtool/arch/loongarch/orc.c | 6 ++++--
 tools/objtool/arch/x86/orc.c       | 4 +++-
 tools/objtool/special.c            | 4 ++--
 3 files changed, 9 insertions(+), 5 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.34.1

