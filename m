Received: from mail.envs.net (mail.envs.net [157.180.15.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A642EB856
	for <loongarch@lists.linux.dev>; Sat, 28 Mar 2026 22:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.180.15.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774738767; cv=none; b=DRaulXex2BMwhrW5L/iMXX+EYtHaZ5JU0T3m2yA+8XTWv88mw7Cw2jkJPrfBWIDcuHFvmIcpO0bGjVtJhS3PM8L8JkeJBghPf8wlafYpAH5PKrPpChTBtHHYZ7sb/HKP1ryw0j3hcNExGpuVIwISnGm5sVzXe7cmbwPg5B/7Gi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774738767; c=relaxed/simple;
	bh=OhgpGjE0T0zkA7su7BK7igj9+7+pozLg8q6IAag2ZW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X7ptF4GEcjMfWlQoBhN82hLNg64QbZLNvvTso9r98NH8LjbAYtVr1uc95WvTUVp9EpY1ExCPA1VyhV6rivM94Q6K4xNMTmjwY5Il6I6EaImZCb5Pxbz8CxuuHGElObDsO2RYLjgLP+c2xGkK5Eok1f7JMzS/mD+Cs/CdmI74y6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net; spf=pass smtp.mailfrom=envs.net; dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b=O6Ifh+fQ; arc=none smtp.client-ip=157.180.15.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=envs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b="O6Ifh+fQ"
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id E53DF1C00C1;
	Sat, 28 Mar 2026 22:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1774738762; bh=6EAGC8YXXG9beHXmThJFPqcq2vq4D2gSJ6HVyTmWHjg=;
	h=From:To:Cc:Subject:Date:From;
	b=O6Ifh+fQGvAEEJ8ZCtIU6bP92r3SZb82UqAlHx6QeZIs3R+TK8Y5cGBIPZw15Fsqg
	 Z+tAnM/QE3cUNCjyMJtcEC5yLb/9S01x9QMdcUJwUc46ms5Be3s0wzYpu7/mBRDxAU
	 h8yER2J1vKndJnVBqh5bk8KxpGeUJQkLaMB5/DI5YzuaIFg8k1eCh5Duhgs7El5uKU
	 kac9J+dujQUI2OEL18DsmQhxGqV8vscaXEP5S/EDKzehMG0j1EXVo90Zc3CYrl9aNY
	 vSxfw13PVdz/EbkOFg6Lz+ybVcCrIAGgn9LKgaKW84zM2C1TCtG86V16DY381n8uAo
	 Lxu8bVysgSbICl9z6mTY3NiWDcLUSTvs2Ug3/nl8Xr/ADjKWnQhwtiDqP50ZaU4pKf
	 viOj2AO0YvC8RrW9vI3wXlpMZ+NEU98wP3lG/UZQ65WZvkiO6u6DLICu3nTZH1Hjho
	 Typq3mXXnSNilJkSBY33wHkj5txLsdP5cCsn9KaTbVqAVCqRQrR974Qm6LtR+dcrCB
	 xQkCpFDyv+Gaj0NeKZJx7CwSOSC23iads6F3mdtEAz2E+T9RTg7OK+4wjwl9LrY9g7
	 B4dM3mrg2LtbFfeneGuZS7gQQcjH+w6VjdwyQ7vkoMYrK5A7DpShUnt+g0bLUjw1Z6
	 +r7PNx34obFjc0AD15YFjjoI=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id f5giKS0InQ-R; Sat, 28 Mar 2026 22:59:20 +0000 (UTC)
Received: from xtexx.eu.org (139-162-51-66.ip.linodeusercontent.com [139.162.51.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Sat, 28 Mar 2026 22:59:19 +0000 (UTC)
From: Bingwu Zhang <xtex@envs.net>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Guo Ren <guoren@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bingwu Zhang <xtex@astrafall.org>
Subject: [PATCH] LoongArch: Increase default mmap randomization bits
Date: Sun, 29 Mar 2026 06:59:17 +0800
Message-ID: <20260328225916.51802-2-xtex@envs.net>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1774738756; l=1387; i=xtex@astrafall.org; h=from:subject; bh=llvkTstdjldEtcCFv9NdCqFhcN1+kiQdJGFu3uZHxfg=; b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgL1erbbl1jNM9AtzeLFJ5FKVqr/ylJ MBUj5+W9IwwCl4AAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA QC5e2ptpSYPKk2KNX8PydOAxosgN0VHeLLa6D/kPu37hFdjfYqXEkcHi9xyyhgCHMDIIz7VqOQC eLqs+FjcZpQI=
X-Developer-Key: i=xtex@astrafall.org; a=openssh; fpr=SHA256:IEYEjkZlkUTr5U9GiDAmZU/4eZus2t2RsxusyhQqwao
Content-Transfer-Encoding: 8bit

From: Bingwu Zhang <xtex@astrafall.org>

Increase default mmap randomization bits from 12 to 18 on 64-bit
platforms for better strength.

The original default, 12, means that ASLR offset has only (1 << 12) =
4096 possibilities. On average, it can be brute-forced in 2048 attempts.
If a service is configured to restart automatically or can be started
easily (e.g. execve a suid program), then trying for 4k times can be
done in one day even when each attempt takes 20s.
Increasing it to 18 makes brute-force much more difficult and leaves
more time for operators to find out attacks.

On 64-bit platforms, virtual address space is cheap, so the
randomization bits can be increased safely without disturbing userland
much and security comes first instead of availability.

Fixes: fa96b57c1490 ("LoongArch: Add build infrastructure")
Signed-off-by: Bingwu Zhang <xtex@astrafall.org>
---
 arch/loongarch/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 92068ff38685..b47c4e4ecbb7 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -740,9 +740,11 @@ config MMU
 	default y
 
 config ARCH_MMAP_RND_BITS_MIN
+	default 18 if 64BIT
 	default 12
 
 config ARCH_MMAP_RND_BITS_MAX
+	default 32 if 64BIT
 	default 18
 
 config ARCH_SUPPORTS_UPROBES

base-commit: be762d8b6dd7efacb61937d20f8475db8f207655
-- 
2.52.0

