Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B4A38B7C3
	for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 08:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776153923; cv=none; b=hAmMh6J5WzhWC+5UXKnQD0ALTVVusUB/T/wtPpu92ouIA/CeqTjrOlU+8VU9wkP/vziil17LeHIoqfnb8s/cWxv8O1kVp0BCVpcvHOkIXfeKUVtvLX6qEPWVrN8lyNdKQbGDTXGcfGtBSfwPOYGZm65w5zKz0PqZztxoGHX0kfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776153923; c=relaxed/simple;
	bh=xRfot5V410ko3VC/JnSvckBt3VT2Kyp1M6wEsrFm0ZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qs/0vVSK8pDIRIAHdlLjqTAJ5NV2BcP7tupL0BmB9Wnzs8tWPodgE7JwGk8ZnxSNeshRCo2NNYpC9pLiGL4nclpLJnsf5x5TkOICztCqxVv/B5rc0W0O1TJeHu7XAqKjMxIOvtD/AcloSGFNW7eV0fZxGQFqhdby+rbTG8QOnzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=AOlV6OVP; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="AOlV6OVP"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35fbca04006so821756a91.1
        for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 01:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1776153921; x=1776758721; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F6633lJHMBTkrsVPQmGB6HI2mM0l2A6MHXZK2D7n6dc=;
        b=AOlV6OVPoqFGhnnyPTzhvVbFEFS9z6RvvpEwGJFRt6ylzzYh88YOj+6n8yJZlSC23Z
         s8sWrYzLSt/8F11Rmc1y6bCmmoXcdo3V3aY0nTA2il9Hmn6eQbJHAsmDXz7MQGGAj4Ea
         K8grI5ttfS7lyiugiNw2OXJXpztdqt/9SStZyrrwnBAsqDkQEAWeTdysmBW6FVzyIyze
         W/9TtpJuop48CoPmDCiqpqyFhyyUOOeg5CAjdE92z/6v+5GqphJASK9VCc2pDApnquTR
         U5o64xA1YObt2mw2YM6Vhoy6lGLeMeKCABEWAHeH+Acqdtoxt1p3GIHtSa9rndOHq41Q
         bD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776153921; x=1776758721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6633lJHMBTkrsVPQmGB6HI2mM0l2A6MHXZK2D7n6dc=;
        b=SfzWGW2d/75PXwZMC16gypgdRoAP/TiVCBU5zW4++1jjD5cWMipefcCNakNVrOW9KV
         OoDvx8+9BcszICjeW1kyJqP7qdZxuZeRc44eih6e9scM8KHwr48OrEygEv+jBepxqU01
         bLgT3rKxtpyxWvJKxAWfWQcHKVa7SNkTpIx3SgPerWpMhz2g0hvkkdZs6doVmwsJx1rb
         /6mwAzN45gozWZ9jzfh6BYEL8OTkPTFb/YPEy64dv2FNOC/idlZF8Lw/LHnanufkzFjK
         MaKoe3hvcWiFjc5+Pbyblcgb3AdzfG5dOub+h0flDhfUQCVOPBWLcBMtf/M+BkG1BaqQ
         mmSQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yE8HdxYy0xlKNU13mcHfd4JRKhQZTgIWbslPYDkJwLmvI/azDu/pZdc3gwPAz6hPf/wX+uLnpDag=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZBBJZnODYQA3DXloTZj4gDVFocQoGhCve6V2dpvlCkGxjC6iR
	IeV8Cq6plpY8RR3+1BjNBAkmgw6hCvg9XyIz6tuRxKjnot4znFYh3JXP04ovIvI++l8=
X-Gm-Gg: AeBDievrioSQj7EXaKHs4iw7rdLQL6DtezEIAEyMoNGfmq6AVdRUoP/pZ0LjBFHtBJO
	HFe6o8TAZCJPQkhKq3lf0DT8hF8E+zsoWyxkGyfEnxHpW8z+UiJHT7Uu2Ug5edUZceh8Ivz8YUG
	MHucwLUufBUHxQGVesMD+PhigjkYSZ88KW0IFxxAd04wHTtsn2arbV1OXlXzMocAHEqSf2k//55
	EsrDCQPUITFRRVpLtJtfEiyDHVyzfIUWLcOU3eNDQ4qg5OwNqRv//kl1pR0CMuGM4b+kfLnXTI5
	YG4zKdphFANCK7dDHnN5WplMUabxWtkmi1otR6UX8QTYxeaLf/B5AEmfeQWxkGKpkCTPF2hXL8+
	pyoyHCQji2GAgqiYlV4AkltovRrtmrKwgEnZAyAxd5f9Ra+rlhlM2ljBEiagGtcgheCbIc0vCqI
	Kq9S6Yg3FfFg==
X-Received: by 2002:a17:90b:3e8a:b0:35d:a542:2dbf with SMTP id 98e67ed59e1d1-35e428320a8mr16108998a91.20.1776153921460;
        Tue, 14 Apr 2026 01:05:21 -0700 (PDT)
Received: from xpc ([2400:8902:e002:de21:a5e:ca8a:49d9:fb8a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fc6e3fe18sm1243071a91.2.2026.04.14.01.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 01:05:20 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	loongarch@lists.linux.dev,
	Haiyong Sun <sunhaiyong@loongson.cn>,
	WANG Rui <r@hev.cc>
Subject: [PATCH] perf build: Add clang and rust target flags for loongarch
Date: Tue, 14 Apr 2026 16:05:00 +0800
Message-ID: <20260414080500.320095-1-r@hev.cc>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Haiyong Sun <sunhaiyong@loongson.cn>

Add missing CLANG_TARGET_FLAGS_loongarch and RUST_TARGET_FLAGS_loongarch
so that perf can be built with clang and enable rust cross compilation.

Signed-off-by: Haiyong Sun <sunhaiyong@loongson.cn>
Signed-off-by: WANG Rui <r@hev.cc>
---
 tools/perf/Makefile.config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 15fbba9f4..1340744a6 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -27,6 +27,7 @@ CFLAGS += -fno-strict-aliasing
 ifeq ($(CC_NO_CLANG), 0)
   CLANG_TARGET_FLAGS_arm	:= arm-linux-gnueabi
   CLANG_TARGET_FLAGS_arm64	:= aarch64-linux-gnu
+  CLANG_TARGET_FLAGS_loongarch	:= loongarch64-linux-gnu
   CLANG_TARGET_FLAGS_m68k	:= m68k-linux-gnu
   CLANG_TARGET_FLAGS_mips	:= mipsel-linux-gnu
   CLANG_TARGET_FLAGS_powerpc	:= powerpc64le-linux-gnu
@@ -1167,6 +1168,7 @@ ifndef NO_RUST
   ifneq ($(CROSS_COMPILE),)
     RUST_TARGET_FLAGS_arm	:= arm-unknown-linux-gnueabi
     RUST_TARGET_FLAGS_arm64	:= aarch64-unknown-linux-gnu
+    RUST_TARGET_FLAGS_loongarch	:= loongarch64-unknown-linux-gnu
     RUST_TARGET_FLAGS_m68k	:= m68k-unknown-linux-gnu
     RUST_TARGET_FLAGS_mips	:= mipsel-unknown-linux-gnu
     RUST_TARGET_FLAGS_powerpc	:= powerpc64le-unknown-linux-gnu
-- 
2.53.0

