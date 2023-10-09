Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1178FC06
	for <loongarch@lists.linux.dev>; Mon,  9 Oct 2023 12:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+nTKzlQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A23E8C433CB;
	Mon,  9 Oct 2023 12:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696855340;
	bh=0Mvn9evzK2eDTt9ImjWv6gFTvimaT+Ux65IlUsSU9J4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a+nTKzlQYxS210dCgf5bEFFzKx9iYFpjdrYTH5DJ6GVdRyI9ueR8xc3qJhRYOTEt+
	 hGNE7G28BPmLvowjslnpOULS/Gij+RwY5hxX6KdVqrON7G+tGhMAoH1kCQmoX+GbD2
	 SwDW8g6Y2b5udj3KUO+ZS95oNT//z+FLa5v8TMzOHOOtnx4wsUULlfbZBBnFkzOfII
	 f0eEVUOXXZg7LVO+2scQ9jU18eJfnam2vELwA7kFzSfLe8O6IajPX+tb2QVp6+SZxN
	 0J4oVhunK66t5+4zMUgOeLUbA7VI540cA73O4xzziJ6Lrs8MQRVZ65g4f6pOczPY0j
	 txTCCRRjkdTFQ==
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
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Richard Weinberger <richard@nod.at>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 2/5] UML: remove unused cmd_vdso_install
Date: Mon,  9 Oct 2023 21:42:07 +0900
Message-Id: <20231009124210.1064021-2-masahiroy@kernel.org>
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

You cannot run this code because arch/um/Makefile does not define the
vdso_install target.

It appears that this code was blindly copied from another architecture.

Remove the dead code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/x86/um/vdso/Makefile | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/x86/um/vdso/Makefile b/arch/x86/um/vdso/Makefile
index 6825e146a62f..b86d634730b2 100644
--- a/arch/x86/um/vdso/Makefile
+++ b/arch/x86/um/vdso/Makefile
@@ -67,15 +67,3 @@ quiet_cmd_vdso = VDSO    $@
 
 VDSO_LDFLAGS = -fPIC -shared -Wl,--hash-style=sysv -z noexecstack
 GCOV_PROFILE := n
-
-#
-# Install the unstripped copy of vdso*.so listed in $(vdso-install-y).
-#
-quiet_cmd_vdso_install = INSTALL $@
-      cmd_vdso_install = cp $(obj)/$@.dbg $(MODLIB)/vdso/$@
-$(vdso-install-y): %.so: $(obj)/%.so.dbg FORCE
-	@mkdir -p $(MODLIB)/vdso
-	$(call cmd,vdso_install)
-
-PHONY += vdso_install $(vdso-install-y)
-vdso_install: $(vdso-install-y)
-- 
2.39.2

