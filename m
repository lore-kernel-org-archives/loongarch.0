Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459A615E9B
	for <loongarch@lists.linux.dev>; Mon,  9 Oct 2023 12:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKSDQENl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD3BC433C8;
	Mon,  9 Oct 2023 12:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696855351;
	bh=ohuZp0WsPxcwHw6R6rlObohasBZPv2zNfsGPMOVNB0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BKSDQENlvCmvcUrtGTpvgpXpECfR89ZihieZKhN8yFEcgvnaQah5u+fu1s9cT4cyh
	 t0XXIrXBr5Wh2tHs5U1wgNNLvlJriRBgYeecMegYSMNkZLiT37eCLJlFIUbu7rxsbG
	 5sr0In6kOsFUzhVpOudgXO5aL4REohZCiaJPgybNzfR2soQZC2ttQ0uYemp5lQ6Wtx
	 vi8oA26zKj5teKiNkX8lGRKZNfEXHLCGSxdgSIRTbQ/cGXWeU3YnKa2qbLlIVXNKLs
	 UbTjRun9wVsuKTpkgtho/Jv5qMGp9UmJAFMvr18c5+F3RNdavwcms6ANinS9j1avAn
	 oEcB4ugnaUyQg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 5/5] kbuild: unify no-compiler-targets and no-sync-config-targets
Date: Mon,  9 Oct 2023 21:42:10 +0900
Message-Id: <20231009124210.1064021-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009124210.1064021-1-masahiroy@kernel.org>
References: <20231009124210.1064021-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that vdso_install does not depend on any in-tree build artifact,
it no longer invokes a compiler, making no-compiler-targets the same
as no-sync-config-targets.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/Makefile b/Makefile
index 2170d56630e8..982b1ad33287 100644
--- a/Makefile
+++ b/Makefile
@@ -277,10 +277,6 @@ no-dot-config-targets := $(clean-targets) \
 			 $(version_h) headers headers_% archheaders archscripts \
 			 %asm-generic kernelversion %src-pkg dt_binding_check \
 			 outputmakefile rustavailable rustfmt rustfmtcheck
-# Installation targets should not require compiler. Unfortunately, vdso_install
-# is an exception where build artifacts may be updated. This must be fixed.
-no-compiler-targets := $(no-dot-config-targets) install dtbs_install \
-			headers_install modules_install modules_sign kernelrelease image_name
 no-sync-config-targets := $(no-dot-config-targets) %install modules_sign kernelrelease \
 			  image_name
 single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s %.symtypes %/
@@ -288,7 +284,6 @@ single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s %.symtypes %
 config-build	:=
 mixed-build	:=
 need-config	:= 1
-need-compiler	:= 1
 may-sync-config	:= 1
 single-build	:=
 
@@ -298,12 +293,6 @@ ifneq ($(filter $(no-dot-config-targets), $(MAKECMDGOALS)),)
 	endif
 endif
 
-ifneq ($(filter $(no-compiler-targets), $(MAKECMDGOALS)),)
-	ifeq ($(filter-out $(no-compiler-targets), $(MAKECMDGOALS)),)
-		need-compiler :=
-	endif
-endif
-
 ifneq ($(filter $(no-sync-config-targets), $(MAKECMDGOALS)),)
 	ifeq ($(filter-out $(no-sync-config-targets), $(MAKECMDGOALS)),)
 		may-sync-config :=
@@ -675,7 +664,7 @@ endif
 
 # Include this also for config targets because some architectures need
 # cc-cross-prefix to determine CROSS_COMPILE.
-ifdef need-compiler
+ifdef may-sync-config
 include $(srctree)/scripts/Makefile.compiler
 endif
 
-- 
2.39.2

