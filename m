Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4038825
	for <loongarch@lists.linux.dev>; Sun, 13 Aug 2023 15:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49CA9C433C9;
	Sun, 13 Aug 2023 15:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691941979;
	bh=wipUm36EeLOhsTYkjnhUDKD8iAG8BWULxaga3ruaIlY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P+8Z8E/D7OruKMbN2nbh2306aZzGCluFm8vMUEkTdAT6iAugXp6g6LqWvF3lRHMIi
	 1MafmUMtge8UUiPEG6G/dw+EKAqo1rqX4kK6Ksn5u7CVSHlLt7AEJnoCnIIGCukkvr
	 f2d9BfbFL+hzGFb71Hb0URUjbD/1cWmGE2ldoUhDCGBLiJSAodSvMR5yloKWNuh09n
	 tailTglVIQu855KMWl4/By41ctZ6Xz3y8LDgv4F6AqOpa3o5XKpoNOiO4EvrjoHApV
	 gbymAHcJ3OqCam2MO3PKEIU95ZsIwrcO1ehNCkxB6q4G4glvjeQ+P+mXzYdsNuEAHH
	 JOeOwEaHdkyOQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	Sasha Levin <sashal@kernel.org>,
	chenhuacai@kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH AUTOSEL 6.4 51/54] LoongArch: Only fiddle with CHECKFLAGS if `need-compiler'
Date: Sun, 13 Aug 2023 11:49:30 -0400
Message-Id: <20230813154934.1067569-51-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230813154934.1067569-1-sashal@kernel.org>
References: <20230813154934.1067569-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.10
Content-Transfer-Encoding: 8bit

From: Huacai Chen <chenhuacai@loongson.cn>

[ Upstream commit 54c2c9df083fe1d4a9df54d9876f32582ce6d77a ]

This is a port of commit 4fe4a6374c4db9ae2b ("MIPS: Only fiddle with
CHECKFLAGS if `need-compiler'") to LoongArch.

We have originally guarded fiddling with CHECKFLAGS in our arch Makefile
by checking for the CONFIG_LOONGARCH variable, not set for targets such
as `distclean', etc. that neither include `.config' nor use the compiler.

Starting from commit 805b2e1d427aab4 ("kbuild: include Makefile.compiler
only when compiler is needed") we have had a generic `need-compiler'
variable explicitly telling us if the compiler will be used and thus its
capabilities need to be checked and expressed in the form of compilation
flags.  If this variable is not set, then `make' functions such as
`cc-option' are undefined, causing all kinds of weirdness to happen if
we expect specific results to be returned.

It doesn't cause problems on LoongArch now. But as a guard we replace
the check for CONFIG_LOONGARCH with one for `need-compiler' instead, so
as to prevent the compiler from being ever called for CHECKFLAGS when
not needed.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/loongarch/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index 63a637fdf6c28..95629322241f5 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -106,7 +106,7 @@ KBUILD_CFLAGS += -isystem $(shell $(CC) -print-file-name=include)
 
 KBUILD_LDFLAGS	+= -m $(ld-emul)
 
-ifdef CONFIG_LOONGARCH
+ifdef need-compiler
 CHECKFLAGS += $(shell $(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -dM -E -x c /dev/null | \
 	grep -E -vw '__GNUC_(MINOR_|PATCHLEVEL_)?_' | \
 	sed -e "s/^\#define /-D'/" -e "s/ /'='/" -e "s/$$/'/" -e 's/\$$/&&/g')
-- 
2.40.1

