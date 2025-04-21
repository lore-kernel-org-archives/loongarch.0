Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08012111
	for <loongarch@lists.linux.dev>; Mon, 21 Apr 2025 02:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745201023; cv=none; b=qFRJjOGueWUZjMq6M361UpmmoM6QJLnTeoTY7CvrrCkERPYs4Ey/cjEyPgNmKnVVkIIw8cXFjPAwUzv/woBQpIKxQQ3gGnWOdpTos7gFWOGqqDkOnCERhM0TZphXFfYsAEk5NnzymNOq/VQXFihaGduw7FUvKDoqvMElR9AxzJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745201023; c=relaxed/simple;
	bh=m0s9ytSqc2Iqqw41RJe0mSHgQkNyHcgDx2m7UiUTZBA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZE+U3o4tzRwr2TEMMDZ5ptemlvl59GqgGcMsqLT1T8f2rlrYHWmzMfRKlw/uMl7o7/9isv+45KtAcs/8qLwH7R/GLDWijG4lhHNo8kN1TY6VS6DYoJdii/uN/AoUgEbDMB29w6WNHMIvzhPGcX746RvahMQA6oIYfT0LdMXhhy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jlz8QpH1; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jlz8QpH1"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745201019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jyWTXseXMPO0/eTp6TKed546agjYDgQJ41Q7AZMGEN0=;
	b=jlz8QpH1cG+szknjeL6ecY0xD3xo3N69CFRMjrlkyAvsEhxd+HQ1aqLboJY0aza9i7/sfw
	gD4wl/ILwXk+MsSq+gm6pfi8ZDamcl27Cy+8mrZ4AkIIZy/uakamG+GKs4dJixsb8Ha3TX
	cob+liHgGLsysOt6Hy5HWqvVm0pccWQ=
From: Youling Tang <youling.tang@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	youling.tang@linux.dev,
	Youling Tang <tangyouling@kylinos.cn>
Subject: [PATCH 2/3] LoongArch/build: Add fallback install.sh
Date: Mon, 21 Apr 2025 10:03:00 +0800
Message-Id: <20250421020301.34185-2-youling.tang@linux.dev>
In-Reply-To: <20250421020301.34185-1-youling.tang@linux.dev>
References: <20250421020301.34185-1-youling.tang@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Youling Tang <tangyouling@kylinos.cn>

As specified in scripts/install.sh, the priority order is
as follows (from highest to lowest):
  ~/bin/installkernel
  /sbin/installkernel
  arch/loongarch/boot/install.sh

Fallback to default install.sh if installkernel not found.

Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
---
 arch/loongarch/boot/install.sh | 44 ++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100755 arch/loongarch/boot/install.sh

diff --git a/arch/loongarch/boot/install.sh b/arch/loongarch/boot/install.sh
new file mode 100755
index 000000000000..c97f611ca913
--- /dev/null
+++ b/arch/loongarch/boot/install.sh
@@ -0,0 +1,44 @@
+#!/bin/sh
+#
+# This file is subject to the terms and conditions of the GNU General Public
+# License.  See the file "COPYING" in the main directory of this archive
+# for more details.
+#
+# Copyright (C) 1995 by Linus Torvalds
+#
+# Adapted from code in arch/i386/boot/Makefile by H. Peter Anvin
+# Adapted from code in arch/i386/boot/install.sh by Russell King
+#
+# "make install" script for the RISC-V Linux port
+#
+# Arguments:
+#   $1 - kernel version
+#   $2 - kernel image file
+#   $3 - kernel map file
+#   $4 - default install path (blank if root directory)
+
+set -e
+
+case "${2##*/}" in
+# Compressed install
+vmlinuz.efi)
+  echo "Installing compressed kernel"
+  base=vmlinuz
+  ;;
+# Normal install
+*)
+  echo "Installing normal kernel"
+  base=vmlinux
+  ;;
+esac
+
+if [ -f $4/$base-$1 ]; then
+  mv $4/$base-$1 $4/$base-$1.old
+fi
+cat $2 > $4/$base-$1
+
+# Install system map file
+if [ -f $4/System.map-$1 ]; then
+  mv $4/System.map-$1 $4/System.map-$1.old
+fi
+cp $3 $4/System.map-$1
-- 
2.38.1

