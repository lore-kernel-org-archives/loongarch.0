Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1004E374E6D
	for <loongarch@lists.linux.dev>; Fri, 21 Aug 2026 03:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787282952; cv=none; b=hElFWXidkSRCfbf7x6K3RJgCDL+zXDFSIiiYL7G1xtOtQ1l/RimnzmvyWdL1MSXpLrDw/G9nKrtf6+zj+uFpoUgwVULwbMf55OXyibZd/5U3KANury598TiIKjZHe8J0Vb6cjKCjsr7uZ/rp1zoP2dpuD1de4xSKIYgeHNYJiy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787282952; c=relaxed/simple;
	bh=MVswPW0ImM4I38bFgy87d8WVzTdnYOUFvl7l/nkBZGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VA5SImrE6B+BoDzhpkyglSN/doCR/5FDMJI3kvTDIAjUx7DEbyuPf3yPqaQh8XaRTUa1R0MkZm3xtiXl4no7bXUEPWiRZMOAQRMyr3REfUa1CXJ/c4lqSvi4qFGpb1K3NECYAQ3jA/pHCDySk9bku23H554sju4B/u5KeHZAYzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=smB013S6; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="smB013S6"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38deea72eebso479408a91.1
        for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 20:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787282948; x=1787887748; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yiTS9UrmoBrDPpC0trCnmUAqEmBXDf+UybIjZa54OgY=;
        b=smB013S6Ba0yTxwDwoO6emEh+xxZ/kAyA5FcSEMRx/qUp5+SV3N3zJiXrvDnYTcsfE
         nhD/tZFpVfeUEY9+tuHdp1bVRQ1qxwgO6CRtlfLSue7HSm2ukuXNhGRmN8LOymyqAVON
         BQUi3BVtb5RooJdTg4vOqH0qlTSxLQ6xKS/t0aWrPH4K4bQPnBVipiD4R/8cA4Ys5IZF
         v/W7CPC46dJKrcifk+rUmUAf/POm4CLyZ7fqb2GYAd4gzEzmiBbWO1WH+3Owz3RTfmnI
         qUF6NhjOhVvencWrCB9p8f0R3aT8UyWbhD2YmrePKhYtfarncKhY017JAH9CR2ch6hP6
         FjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787282948; x=1787887748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yiTS9UrmoBrDPpC0trCnmUAqEmBXDf+UybIjZa54OgY=;
        b=a6xG3YlstZo8o5t1Jp9zWjStHrBoXzTkFJoetzBw7YVZ389r1cNKos/rFOLuhPeiAv
         QBzUnJoQYecSeUowN1OWJG+OQkBIeFmPK/su4mBOlkQdtJ+JF9vb2zO/dXbnvIwlxoo1
         EQatIjn1KWZjPr787oHmkWMPHGlEh1FVVRwcE41q9c8JjYpAar/6tInSY7A8OX3eZMdP
         aPDuyQTKuGHA5ID9pBqBKsy0Um3aGccNyNmrX9gGZdFyIASHvFrdAMqdQTBjgF5Q7xvX
         KnqdQLNfcSU/tGStCtmuBmPe7W7t+OSqbBIeDkzKpj06hgedHMinAH+hYw2OctO8rsiJ
         ZaAA==
X-Forwarded-Encrypted: i=1; AHgh+RpAiVhN6K1/V43+SwiF/uLPY67aqy5pd0tif2Lw+/iqKMsJ7Bt9SEoNr/tBRG4H1HgUsaS1FUZgyjw=@lists.linux.dev
X-Gm-Message-State: AFuF++kn41FAtlORvreF31qe+zaZ5CsUy7qhc8wB102lwZbyvaDh4gub
	urhoT+KiIww9xcP1xwPylwrRxW6kGBFbMc4cEo0cXyHUP+knr96GNyyn
X-Gm-Gg: AR+sD122Kq7z9qOi/Nkr98m7qbkFAl26sivhKWBinMP/iqxj4JNuPJ3MrYqYskjOuFG
	iMHiEvt4NO4yEFXIEg+IxVGTnMJUIZjQvm2ijWLVrFDklxAzwqfAjqykC3ZR95YrlUe4mxAQdA3
	SsyRdPrYApIS2P+OfBMBqks4AhwQzTIzWnbH1JDrphVYZVtclAa1A8CNRYbkQBe2aIvdJWd6gCt
	IMs0KypBVWoRCXPmIUTPdHeKURiCUuwcWcOYzjg2eljwuLX+fmyzdzqi4f71sJfkP8WsLqdNw3Z
	9Rr3vzn8kxm382wwu+fv3pbmVh2RD/RY3iNWJ1/VX38V3P7YZu+64nDW3xBa32FfJZ1shaZ3vmO
	sGySwsEtpYQvVWQHzoXhSx/upR51rxlLy6P2L66hlZhECt2UgE3SBO8fowG03C31d/t5XicooZ/
	XAQmQMPJlMOlotBamzijXhcWW7boUWbwG03wNKN7NIfnaSBHG6ZfggLDzbiVrZpFC952S0Ob13a
	9q1OA==
X-Received: by 2002:a17:90b:4c41:b0:380:7688:fbe9 with SMTP id 98e67ed59e1d1-395c354ec51mr5213544a91.8.1787282947629;
        Thu, 20 Aug 2026 20:29:07 -0700 (PDT)
Received: from localhost.localdomain ([2408:8406:1941:17d:accf:ab29:4a32:29f1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4570e63sm1319318a91.4.2026.08.20.20.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 20:29:06 -0700 (PDT)
From: Li Fangxu <lifangxu22@gmail.com>
To: acme@kernel.org,
	namhyung@kernel.org,
	chenhuacai@loongson.cn
Cc: peterz@infradead.org,
	mingo@redhat.com,
	git@xen0n.name,
	linux-perf-users@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lifangxu <lifangxu@kylinos.cn>
Subject: [PATCH] perf build: Add rust target flag for loongarch cross compile
Date: Fri, 21 Aug 2026 11:27:02 +0800
Message-ID: <20260821032702.4258-1-lifangxu22@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: lifangxu <lifangxu@kylinos.cn>

Based on commit 30f998c992c9 ("tools build: Fix rust cross
compilation"), add rust target flags for loongarch cross tool to fix
perf compilation error:
*** Unknown rust cross compilation architecture loongarch. Stop.

Signed-off-by: lifangxu <lifangxu@kylinos.cn>
---
 tools/perf/Makefile.config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 0ba307e78fe1..42c0ef213750 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -1149,6 +1149,8 @@ ifndef NO_RUST
     RUST_TARGET_FLAGS_s390	:= s390x-unknown-linux-gnu
     RUST_TARGET_FLAGS_x86	:= x86_64-unknown-linux-gnu
     RUST_TARGET_FLAGS_x86_64	:= x86_64-unknown-linux-gnu
+    RUST_TARGET_FLAGS_loongarch := loongarch64-unknown-linux-gnu
+
 
     ifeq ($(RUST_TARGET_FLAGS_$(ARCH)),)
       $(error Unknown rust cross compilation architecture $(ARCH))
-- 
2.43.0

