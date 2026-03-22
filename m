Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A243803E8
	for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 08:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774166636; cv=none; b=c3g2y+5J+2H++vuQDfPNdIPm47qTLQVsUPac8oZ1d79ZrLWY+zgtIZF/ERPed27KKn13Qe1zIyMIofsUkyupPVOTvwkVjcRsQhy4/uePebKF4T3yY2OF6CGdWIDAA4uJG8C9TbiYYhR0MeLYoRajTgdqcvkZ65w+b1Q2j0hj2dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774166636; c=relaxed/simple;
	bh=8xfx3WzY1qxGFqr1kTfSBij3Cun70YAgBG/ZNyYjGOs=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=nV/27VAA3bObptqGdlomvOVuUAjHRKpf5p8HmuzcekZlGAIoreWJx/Qu40rYqvVWf4/qJjZjV+467BUUaMQ7AjbF1N2FMy2LJ8DZyMxeP9WyUTmB2r+dvT6fnR6WSr/b/2iB6l3SULY/rl8r5OvHhLgMKLEF69BMn+5t6YXSUSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=jwwQcydz; arc=none smtp.client-ip=203.205.221.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="jwwQcydz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774166622; bh=1BvRYR6lmdrA4hynSKQhzU7hYO6Na2SwVAZl+zmB/dc=;
	h=From:To:Cc:Subject:Date;
	b=jwwQcydzfC7Uz20nlcMQvWpy0CSd7WfIwCqkjAc/xb4O3I7wucuKpNdGuR42NeMAm
	 tyZyDYf5MN0mB0bv3cXvufJjWvta6ZotsjsGoJ8Oeht3YrZ2nGLooEa4hvgsVpbBmb
	 58NSN+nP2hlbR/R6dKDTZWc120el3+ZvyQJ/YGJ0=
Received: from MYJGMC.tail4697e5.ts.net ([122.195.139.226])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id E78F8E1; Sun, 22 Mar 2026 16:03:39 +0800
X-QQ-mid: xmsmtpt1774166619t1b7pk5ym
Message-ID: <tencent_8242AF7669D3804CAA38B34A176CA95AD308@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3Juz82FgX+YcIWwGWEca5gPyoOXG3NiXlgnP68c7iSrJPj4C7HpLD
	 TRW0Qz6NIdOY4ek2jB6vK2lLY4nJNkb/o/rGRdv/qffDpUWXGw6XRD9QrROhyCyB1AQ63K826ODy
	 wVkMfpAe8tFO2r/1sry2Xdj7oucQQMu98NN2UDREQGwDj8UAylSqzMI4J+u6o6cERd5mBesns9IM
	 yxy1QG5rdIGhSfGvBB9hfiSF8VmMEKmNYwPKghDw7psbP1nzGO1KQ/18xoSVp977hcd85GimO5Ro
	 wBM/rLbS67ECWh8w2JCZ37tCNcR6LmkIqWuB90h1uElILgGzrUFlC7/Fu2SsW7pNYDlPVIk/Rn0Z
	 om0sCuDl7h+1B6kOSocYjS0erZROcZOExWnahENc3nArIy4yQ6lFKrLekp1WAA0gLdApJl927Rje
	 Ydlme4gc7doPvyk8qQUk9J8Nyl92crEzM2FvcDOqVPgqXrRJoP7bj5Rp8DBNP8yWPRtGpcT6fTHv
	 af2Tmkg5ypPaJzunFkGY3eYXNonjPJkSBOtSzo7UlnE25mFtyVE05qH8g3Par+WenuHHF9RoZEeA
	 x1AHXDoPEv/zKB9cgtMy8SXUP+4CuStRmRw/lCd4gS5o/ffWZHz1CRxt8cWqtiE3idF3f/CFEWF7
	 A/y+djHK20mILu2SQXChqqewWPKy5+VB+myAJ0XEMyKEWuVfb3iTdapMuLFOdXEu/1rBXoG4zGWX
	 dCQIDNY+8Dv4D87iLDQQElv23sLuFNwJ+1LCuY08pBLP0EcorRNy/ZMZWnijtHdFfoQeda93E2Ok
	 nMNHu4kaslD8puJP8r6N9nJ/Qbu39Vj4Ere14Yammfr1Y83nwCzhQ4ttmcJfHHEieBPFbW8Vb58N
	 dhvmy45LqXTKUMAWBXVlHcHFxfEioFNbzi8M1uhLwkasK6jlVDOOKZnm1mO6OBqMhG+fMdCzSQZL
	 o1vmDYnS8zh8pGCipuM0VgtgcIYILrKf9vMYEVrwfoQAK9IOnlysM8NlDhNiWo6xymfW9DOwg2h2
	 dxyzletGiwYrUX0QCtfAtm9URSLb8=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: wjjsn <wjjsn@qq.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chenhuacai@kernel.org,
	zhuyinbo@loongson.cn,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	kernel@xen0n.name,
	devicetree@vger.kernel.org,
	wjjsn <wjjsn@qq.com>
Subject: [PATCH 0/2] loongson2 clk: introduce ls2k1000 specific compatible
Date: Sun, 22 Mar 2026 16:03:25 +0800
X-OQ-MSGID: <20260322080327.1606799-1-wjjsn@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "loongson,ls2k-clk" compatible is currently used for the
Loongson-2K1000 clock controller, despite being generic.

This series introduces a SoC-specific compatible
"loongson,ls2k1000-clk" to make the binding more precise and
consistent with other Loongson-2 variants.

The existing "loongson,ls2k-clk" is retained as a deprecated
fallback for backward compatibility.

Patch 1 updates the devicetree binding documentation.
Patch 2 adds driver support and updates the DTS.

wjjsn (2):
  dt-bindings: clock: loongson,ls2k: add ls2k1000 compatible
  clk: loongson2: add support for ls2k1000 compatible

 .../devicetree/bindings/clock/loongson,ls2k-clk.yaml        | 6 +++++-
 arch/loongarch/boot/dts/loongson-2k1000.dtsi                | 2 +-
 drivers/clk/clk-loongson2.c                                 | 1 +
 3 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.43.0

