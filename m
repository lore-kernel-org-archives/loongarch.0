Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708230;
	b=OP3RmqwGYfpWoAPEgBw7gghDSat9wgCiwQnzQMWYiVrn8Z6CDD53kq5iDIpbW1QM+D47
	 zmGhRHUZyi8njQDVDLKwYdfhiNLbrXc2pfzcTiK9nuTL5Frk/X+zjK20J199q2VJWhJeG
	 cpEaMysS24d2yoB9tAQwRJyXMIk3D3/MJbqlF6DbwYrUIfBl0np8SBvstHx7ejG6sqVlN
	 KJhpaUW3WjSYAUfsS3eC8JXXmkA4kjJoo0wjCfRfIjJO1C05QPDec58dBtWlaYu02YTxg
	 GbRy0RVj4KwqzdK9E63qUqTj9DQLA1GbghwnQUaeTyxD70zdMR8RYt8eSmXjqQTgdwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Developer-Key:
	 X-Developer-Signature:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=rC/Xx94cadzkuHniLHfGoo8rPcnI5K0Jk9viyXYTTZs=;
	b=X2q3NAmzc+hTPHEsV1HQ7o2QJSXDiJk4hT7LaYUzfSqhPTZv+Qg/2G4V7rkywjNni7bA
	 i+QD3dJX+kqiCy2vGce9KJ14+jygQXsNd+IyLce3O7TrkK50OfoUTnc/gm+mRQRuQfNiz
	 WDTLVeImNQOwqNJTJYlOk7uc2qVihfGUSipD97SblNOFZH+k6EpmCg0mc2AK1PgHMI3rK
	 BG3Hebro0DvpSWuZozY6iANq9n0i788wXGABIfHN95KVu0y3DnD0uoOxUo0Mt6aNCj8AU
	 bugXjVvMFKYE4WBUWNAyzuvMNpvrNozJO5563ZKqjCumk39sN1JBNxfGgpawmm8U4ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gprM06vU;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59739606A31E
	for <loongarch@lists.linux.dev>; Thu, 26 Nov 2026 15:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59739606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gprM06vU
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb9379a835so33918315e9.3
        for <loongarch@lists.linux.dev>; Thu, 26 Nov 2026 07:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795708228; x=1796313028; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rC/Xx94cadzkuHniLHfGoo8rPcnI5K0Jk9viyXYTTZs=;
        b=gprM06vUhAy6Te7ADJi923PMbGN5ynf5q7+/F5ekrh2Ng7ilXdnQToJ/zt0TfdcKFK
         SODD1d4zhCm9pV/HLaBz1xJlEHU0ft5Qy+YTh+jKnKTkcDHtYQC3Og7bynqCE17o6z3O
         gN9KUFgs2gsIfF9aUQTA5ehu+LhSdSWpVq5V+egfQjksj9JSDnAHt64mZyPCL14v7izl
         asAqEYnYQc37CGiTgOr4B7Beuul4OHByEoMrKq+fq+8ZOY/fNiyzQTa36y8qn3QcJk/F
         ZKrkELozFuz/3N07bIjD71V09pz2RiiUxQIzeuvxIru2hvIYUqGfsL16OdjySZV159NY
         PJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708228; x=1796313028;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rC/Xx94cadzkuHniLHfGoo8rPcnI5K0Jk9viyXYTTZs=;
        b=Vh+7Dirhx8yu9fVy3CwogkSdwM9xi+E2wdJjU852zvcjFMr+izFzFFEhKQGXI4Qcx/
         iyTK/5QFpnRgupwwno1syPd+4/t8DIwblcjDPHNvecrmmvdaJgJXZooaCVM/b3SPTiuX
         wIs83DNmZTkzttDSUXbjxlloKqO3fjjAsd3cYNYfBeArek+DN0A0aD+Re49P2BLtXIro
         uNpqQ/KxkwMyCtTXUfCvSvy702NZkMjHOrFYSF4ZBbilWKpWOB52Oj7p1Z097XrRqDcL
         hncEFUfiJZc8gHg97l+RUwE7bVN2EdiHtyQ2lnz/zJ5IO4dqrZJ7mwRAtugS4tM/oapu
         HZ8g==
X-Gm-Message-State: APuU4Z80xOf3IbCxwWjaFNHld7YPtFP2yLw08p/db5OGN5zoE8Ils8p9
	vj9mJRpQ2Z50Y3lvFvLXGYQERORjaBL7lezOIGJbJY7JwLcpu/EvWYDdloDPCFCekClC9iNiGQ=
	=
X-Received: from wmg25.prod.google.com ([2002:a05:600c:22d9:b0:4b6:4096:72ad])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:64c7:b0:4bb:68c4:2044
 with SMTP id 5b1f17b1804b1-4bb887fe725mr408015875e9.11.1795708227448; Thu, 26
 Nov 2026 07:50:27 -0800 (PST)
Date: Thu, 26 Nov 2026 16:50:18 +0100
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=864; i=ardb@kernel.org;
 h=from:subject; bh=qsOZv8x2/phFMLuJ3s1xBSZujyHeWPP7wpnTP7C+N2Q=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZsj1Kr+6FJeu4J2lx1HXCVWNadGK26aHedg/LP0X2rep
 byMu7IdpSwMYlwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgF4CY7MDKcOW8sFGHmJVPts+7W
 sjmnWNMSF0/39Qi+yfdI1vLz28cVDP8U1cIcZr9WbXI8UHRYKlKTbWLSBrYX2aFqh5jEFa96ZbA DAA==
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261126155017.2401147-5-ardb+git@google.com>
Subject: [PATCH 0/3] efi/libstub: Fix library dependencies
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: loongarch@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>, 
	Dmitry Antipov <dmantipov@yandex.ru>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Dmitry reports that 32-bit LoongArch builds with EFI_ZBOOT disabled fail
to link, due to missing helpers for 64-bit integer shifts.

Fix this, and while at it, tweak the build so some of these dependencies
can be dropped for the zboot build.

Cc: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>

Ard Biesheuvel (3):
  efi/libstub: loongarch: Provide 64-bit integer shift helpers for
    32-bit
  efi/zboot: Eliminate unused code from the zboot executable
  efi/libstub: Provide library helpers only where needed

 drivers/firmware/efi/libstub/Makefile       | 18 +++++++++++-------
 drivers/firmware/efi/libstub/Makefile.zboot |  3 ++-
 drivers/firmware/efi/libstub/zboot.lds      |  4 ++--
 3 files changed, 15 insertions(+), 10 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

