Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D627C257AD5
	for <loongarch@lists.linux.dev>; Mon, 21 Apr 2025 05:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745214529; cv=none; b=cjawibGpeaB8BBWss5zSoD+dgRYZTRa1MEJZ9sx2YARDhq7c3ZClJLbPQpitkswICs81c5mNxSnw0tj4t24htJtJmDKPonUXtqd6k64xYagpSiO7P32DL7S51fDvP41v6OBn27v979ZqtWcMaHtMayOC2FyLV/B3jkdx+eMYokE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745214529; c=relaxed/simple;
	bh=y9A3JRroeWYTxd46hgBlioZSDI2MwYHdP5wmDZ0pIv0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FyWpTJsoXXGR/txgIGyyDey6kPkEfuBOqQdG7uQXxOcjmYS8YEjnRd1eQNcCxvNJRVJKsPJrY5tdZcbZVCJMxRMlUGCWY22sgKuR92vGA/2/11bOWnKROXLNRPy7d9MXkMcf66zx3gtzlkjzvW8CbaJa7Qpbuh22kJqLQp5hOFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nrXpzekV; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nrXpzekV"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745214524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FAfNR08WgM84cbv74ne0ZkM/VlszL1AZGZbCuUQLpMc=;
	b=nrXpzekVmChhYKK4Shj58pt3e0AUe4TSWs+FNeGEg14dHpS0MOOMnQTg63t+ofoUmID1TX
	+NYCtK+1JEsoY3Lc7tkfj378cI+87N4DDnjtBRWeoMIEDqkDfQqymHUxL5FLmqHo90aY3E
	FDmkZAEUffU6fdlOXHYFxOLPm+rn81s=
From: Youling Tang <youling.tang@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	youling.tang@linux.dev,
	Youling Tang <tangyouling@kylinos.cn>
Subject: [PATCH v2 1/3] LoongArch: Add fallback install.sh
Date: Mon, 21 Apr 2025 13:47:42 +0800
Message-Id: <20250421054744.46791-2-youling.tang@linux.dev>
In-Reply-To: <20250421054744.46791-1-youling.tang@linux.dev>
References: <20250421054744.46791-1-youling.tang@linux.dev>
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
 arch/loongarch/boot/install.sh | 53 ++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100755 arch/loongarch/boot/install.sh

diff --git a/arch/loongarch/boot/install.sh b/arch/loongarch/boot/install.sh
new file mode 100755
index 000000000000..7ce76810b8b7
--- /dev/null
+++ b/arch/loongarch/boot/install.sh
@@ -0,0 +1,53 @@
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
+# "make install" script for the LoongArch Linux port
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
+  echo "Installing compressed vmlinuz.efi kernel"
+  base=vmlinuz
+  ;;
+# Uncompressed install
+vmlinux.efi)
+  echo "Installing uncompressed vmlinux.efi kernel"
+  base=vmlinux
+  ;;
+vmlinux.elf)
+  echo "Installing uncompressed vmlinux.elf kernel"
+  base=vmlinux
+  ;;
+# Unexpected type
+*)
+ echo "Warning: Not expected kernel type"
+ exit 1
+ ;;
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

