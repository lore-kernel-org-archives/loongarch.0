Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1388F7C
	for <loongarch@lists.linux.dev>; Mon, 28 Nov 2022 17:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F619C433D7;
	Mon, 28 Nov 2022 17:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669657124;
	bh=uima7NwaS8OwqnhFDlO2OGrm2y1ElcTnY0VnoLuZ2Zk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=smVYNVjf9Ce6P9zvFLy5D6Bk7dQOffx+qctPI31fCSLnhfQ7vRkOI13lTuMz0CnMw
	 NEovWGBpeZvNCwc21bBn8UViOWA/PdzqPkNbWky6dG0a8Semec+dSTMT/wwK8cGfeM
	 q9C36URI1tFUitwNhdXm03QY5wMs7KjAs7MyYS2WQCKtMFuOAB+cEViUM132EP8eKY
	 Gtxt7nMvgeHfNSyMbx2pxmxvjwEyoqLa0Diz/JjZhR7eOhUAqefFfc8NrBM5RgM0a0
	 gx6cxkC4pnKzu3Hcj7/vfn6jYPAwXcGqT8/hmdkYxnWuA6EfmKDRVq2I1R5Jm9LEur
	 SPcx6BIi7ajbg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Sasha Levin <sashal@kernel.org>,
	chenhuacai@kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH AUTOSEL 6.0 23/39] LoongArch: Makefile: Use "grep -E" instead of "egrep"
Date: Mon, 28 Nov 2022 12:36:03 -0500
Message-Id: <20221128173642.1441232-23-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221128173642.1441232-1-sashal@kernel.org>
References: <20221128173642.1441232-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Tiezhu Yang <yangtiezhu@loongson.cn>

[ Upstream commit 83f638bca0ccd94942bc3c4eb9bcec24dd8a1cf9 ]

The latest version of grep claims the egrep is now obsolete so the build
now contains warnings that look like:
	egrep: warning: egrep is obsolescent; using grep -E

Fix this up by changing the LoongArch Makefile to use "grep -E" instead.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/loongarch/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index ec3de6191276..9123feb69854 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -68,7 +68,7 @@ KBUILD_LDFLAGS	+= -m $(ld-emul)
 
 ifdef CONFIG_LOONGARCH
 CHECKFLAGS += $(shell $(CC) $(KBUILD_CFLAGS) -dM -E -x c /dev/null | \
-	egrep -vw '__GNUC_(MINOR_|PATCHLEVEL_)?_' | \
+	grep -E -vw '__GNUC_(MINOR_|PATCHLEVEL_)?_' | \
 	sed -e "s/^\#define /-D'/" -e "s/ /'='/" -e "s/$$/'/" -e 's/\$$/&&/g')
 endif
 
-- 
2.35.1

