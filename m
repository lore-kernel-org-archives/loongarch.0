Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E00E7F9;
	Sun, 22 Dec 2024 00:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734826381; cv=none; b=kdGs07bpEuMzEs9FoGWVBPhxOvH2NXAssUNIcvcmhB/3rxpCzSRRc6ckgjUVZA7etxVif3Zg25G/aEELDHmdIpYagTWPp8YUIidLdOaTx/3D4Bn8psk3l+Ph7mFZpezsUET+1j19oLY1ykiRS1LJ+4C8rjAvCc30ztDbKQkMOvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734826381; c=relaxed/simple;
	bh=EmEKEhqNhJSF0gjTdSdwB5Bp+NRESuDXgi0w/RBwEOg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n/YWvR3Q88/++NnPej8hiWUYNfoPRjyjhtUCU57J++uG+1HLfhaL1usHbcK/QxC2T5Z3qUBXNYO8gi4imNSwFDcWyU0jLjtOqJsK4VE/9JBdadu1icuZRXelpCNX8uisvoX7OjG/70OrVbhbFdNu5hPd5jGHJffy1uerkBp+gkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+DfSSOy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+DfSSOy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1406AC4CECE;
	Sun, 22 Dec 2024 00:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734826381;
	bh=EmEKEhqNhJSF0gjTdSdwB5Bp+NRESuDXgi0w/RBwEOg=;
	h=From:To:Cc:Subject:Date:From;
	b=b+DfSSOy0OWAghneh4inZnXhAigB0vmp6S3vHqC4GyMpAFm/J3nsDvs3+5OXJVkVX
	 g/WoLD1+0jW2Hn3ieKWSVx3KCQkTQDShN9y0/zQTXR8Qd3JmGSafiUbMBqTcESyCfX
	 43YzUQmumCBBWT4l/Y0APpRhugd/C086o7ArMIDAhWY47PJVa1RMRkYYXUFBxrostC
	 lDUU/MgGEhL3TpeDSfDj1APsTGnmzD0NsKEhPAeYa6+EC1WZTLg27uc5kX9NUw97G7
	 UVWJXLjH7YGeHkENFg1KMyIIqNZdcQb04gM3WMbYMKrMAhPMUC7cbGsFL7qBz/HKTl
	 1Jg8SAIS64uog==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] LoongArch: migrate to the generic rule for built-in DTB
Date: Sun, 22 Dec 2024 09:11:49 +0900
Message-ID: <20241222001230.2579074-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 654102df2ac2 ("kbuild: add generic support for built-in boot
DTBs") introduced generic support for built-in DTBs.

Select GENERIC_BUILTIN_DTB when built-in DTB support is enabled.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/loongarch/Kbuild            | 1 -
 arch/loongarch/Kconfig           | 1 +
 arch/loongarch/boot/dts/Makefile | 2 --
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/loongarch/Kbuild b/arch/loongarch/Kbuild
index bfa21465d83a..beb8499dd8ed 100644
--- a/arch/loongarch/Kbuild
+++ b/arch/loongarch/Kbuild
@@ -4,7 +4,6 @@ obj-y += net/
 obj-y += vdso/
 
 obj-$(CONFIG_KVM) += kvm/
-obj-$(CONFIG_BUILTIN_DTB) += boot/dts/
 
 # for cleaning
 subdir- += boot
diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index dae3a9104ca6..98e099be912d 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -396,6 +396,7 @@ endchoice
 config BUILTIN_DTB
 	bool "Enable built-in dtb in kernel"
 	depends on OF
+	select GENERIC_BUILTIN_DTB
 	help
 	  Some existing systems do not provide a canonical device tree to
 	  the kernel at boot time. Let's provide a device tree table in the
diff --git a/arch/loongarch/boot/dts/Makefile b/arch/loongarch/boot/dts/Makefile
index 747d0c3f6389..15d5e14fe418 100644
--- a/arch/loongarch/boot/dts/Makefile
+++ b/arch/loongarch/boot/dts/Makefile
@@ -1,5 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 dtb-y = loongson-2k0500-ref.dtb loongson-2k1000-ref.dtb loongson-2k2000-ref.dtb
-
-obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .dtb.o, $(CONFIG_BUILTIN_DTB_NAME))
-- 
2.43.0

