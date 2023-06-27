Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F77171C5;
	Tue, 27 Jun 2023 13:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1687870890; bh=LCFUho+x/i+9Jjg3s4a/kFQNBnAevgmTIXokYnqx08A=;
	h=From:To:Cc:Subject:Date:From;
	b=FGuCdZzgneemCBuX3vcnoudOfAQ2lUs1Kk8uaY3IccA/1ikmcBcxiFiPe3Fb+NoTo
	 bKaz7iCkg/iSqaR+ha7qDlHQyf/HCSghBRZL9QAqj9lVGFViWnzRE162cVBz0uTSMW
	 puxo8Vhb0RExNoCodLyHcxDCHzIu9O4NRpyRiXeU=
Received: from ld50.lan (unknown [101.88.25.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E9BCD6011B;
	Tue, 27 Jun 2023 21:01:28 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Rui <wangrui@loongson.cn>,
	Nathan Chancellor <nathan@kernel.org>,
	Xi Ruoyao <xry111@xry111.site>,
	loongarch@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH 0/2] Fix cross-compilation issues with Clang
Date: Tue, 27 Jun 2023 21:01:20 +0800
Message-Id: <20230627130122.1491765-1-kernel@xen0n.name>
X-Mailer: git-send-email 2.40.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

Hi,

Just some quick fixes to the recently accepted Clang patches, thanks to
Nathan's followup testing. (I test-compiled natively so didn't notice
that cross-compilation was broken, and by chance the LLVM snapshot I
used didn't contain the breaking commit either.)

With an additional LLVM patch https://reviews.llvm.org/D153865 the Clang
builds should now get fixed.

WANG Xuerui (2):
  LoongArch: vDSO: Use CLANG_FLAGS instead of filtering out '--target='
  LoongArch: Include KBUILD_CPPFLAGS in CHECKFLAGS invocation

 arch/loongarch/Makefile      | 2 +-
 arch/loongarch/vdso/Makefile | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

-- 
2.40.0

