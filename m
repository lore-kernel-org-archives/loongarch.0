Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73948F50F
	for <loongarch@lists.linux.dev>; Mon, 21 Apr 2025 05:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745214519; cv=none; b=CBqeaJk5wXmRqqKycoSXwOaoNEpvAl6s1hx5WqO8pskJaaGTglA//9mtv6thXmXCajMPAS1sNAeGqKYxE2Fh6D9RZWS6DzaeqoAmbYVwDJQbE4RtqdAAH0OwZYhPztJejIwwXseYSWvZTeENr7iwY+PA2d+XxiIo7TWTyK6tRug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745214519; c=relaxed/simple;
	bh=tuEn4D5Izs2slNbLELo7Fm0hLXcf7gRnNB4GjCLTEXo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=imTOwJs3ushF8KTg3TnLVcBrftXcTputFOuPwh3aYbBb+X41UK2MgAt+C4tFttwVW+HltZVap+22ewY7I03wfGtC9layf0q9vLeuDze2P0h60Q5w59lMOqU/NtVYLh5REemdiyohCrOAlFl2ypejZuJJ5NXacCOTIhrkUQGkWxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vi8E+RUS; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vi8E+RUS"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745214513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OC7h61hdgEgKx1giV0dIMCdnNREEhlI9Wl+IzK//MjU=;
	b=vi8E+RUS49fdmcJZP7Zu7VJWGmDHjraGMEdkfUsvwvq48sF5TlYlS805Kd3y8nMAZwWCgW
	RPU3pNrLF0U3lYBr2ZAf0ogmuCmYs4BTpYKpe1Jovt9QelBMHPW6XyXfu1U0C16FtOBeKc
	fetUZqBxRXHcmTjgt7suwNYmMtW9MYU=
From: Youling Tang <youling.tang@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	youling.tang@linux.dev
Subject: [PATCH v2 0/3] LoongArch: Adjust the 'make install' operation
Date: Mon, 21 Apr 2025 13:47:41 +0800
Message-Id: <20250421054744.46791-1-youling.tang@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Changelog:
  v2:
  * Adjust the patch sequence.
  * Adjust the title information.
  * Distinguish between vmlinux.efi and vmlinux.elf in install.sh
  * Correct minor mistakes.

Youling Tang (3):
  LoongArch: Add fallback install.sh
  LoongArch: Using a generic scripts/install.sh in `make install`
  LoongArch: Add some annotations in archhelp

 arch/loongarch/Makefile        | 11 ++++---
 arch/loongarch/boot/install.sh | 53 ++++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+), 4 deletions(-)
 create mode 100755 arch/loongarch/boot/install.sh

-- 
2.38.1

