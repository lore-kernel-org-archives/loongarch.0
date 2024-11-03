Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.62.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B478BA42
	for <loongarch@lists.linux.dev>; Sun,  3 Nov 2024 13:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.62.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730641104; cv=none; b=a49DjO8ynigwZJdURw7MIRWaLGIRq6khCexWU29kfUnH8CnNzaUnYxbs7EMtYNDj7jElZ8m4Vqq3KC6F2XG3RCCZNcKT1fNiJssn0g1RVFaaz2B8nxVbUzcsTKqctJNAYbr1Z7hJOdu5kkiM9Qi67DEDkGqMbbm7pcYrdVOak8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730641104; c=relaxed/simple;
	bh=0u2qY5VmW02QoZQQ8PVGB0RvEt+gYfighmeowfpBp9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lHZ8emoECDduGNkGQYkqRZGj+4Mp9q+yxVmuBfrDCWfhLdyF4akG70mZzf5IHaHCYMAtpAgz1a7ahEOkzemMBeUJCBOdtvWf1WIzfEytymqm9PBBDCItDxiONJAMxMrOhPZ0KxXYrGIBYFmEAh65rKNuAEFHE07yRYgKTz2oKH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=KLF8HuA2; arc=none smtp.client-ip=114.132.62.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="KLF8HuA2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1730641022;
	bh=0u2qY5VmW02QoZQQ8PVGB0RvEt+gYfighmeowfpBp9Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=KLF8HuA2XZZA8PyiFIvxZyWe/QyPFXt7v/I0izyxgFtQDYw727X9/PTsC+BZn74Y0
	 mWRYJkxiA6zPS+DHh2CYqTkCl6rOZpFl9M65nsnUxXhTKvCMjUxLR4CJ4QUZsLa+Ci
	 r1taA2f3NHlHgNNy0bmBr+6w+ezN9xazZzSxWx9w=
X-QQ-mid: bizesmtpip2t1730641018t4vihmk
X-QQ-Originating-IP: OJFfFUb+TagDtWAwy6uc0+sLCBe0njxsmdHE22f+THA=
Received: from avenger-OMEN-by-HP-Gaming-Lapto ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 03 Nov 2024 21:36:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16809586154877906677
From: WangYuli <wangyuli@uniontech.com>
To: ebiggers@kernel.org
Cc: ardb@kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	kernel@xen0n.name,
	chenhuacai@kernel.org,
	xry111@xry111.site,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v2 06/18] loongarch/crc32: expose CRC32 functions through lib
Date: Sun,  3 Nov 2024 21:36:55 +0800
Message-ID: <DA8BCDFFEACDA1C6+20241103133655.217375-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241025191454.72616-7-ebiggers@kernel.org>
References: <20241025191454.72616-7-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N6YgFB7a9ocC3pQJxWcp7+Xrliways2mu9o23knf3Akmh/U/46tifWDD
	Zmtnw9LJxsopTQbaWubtG2dud51nf2xYcha4+Y69C4C+471DwmOCqpoN4zAxO47wDQV70EZ
	NB803/RTtOafS5LsEhSa2pXT/Pm7oip6cyqFoW2d4vF6i4qRl8uYTDzWiPcWi4I7LnVqYol
	BpRoSEkl96raCfa8axlwSr+Opdc1J1kd/dHhlgucsXsEQSWLrUzY32rUWk6i5P+scqQkVIK
	jaY3bibsRScpv8SvXBr7qp630Y3JCBCkyKJHLRkuKPcUcMUvpxBqGThWo0h6lFeNDWD4QLR
	p3aME94npPL6RcZXYKUvVa7VWjLkvLkIvBgSFWr+i7DjY+GO4CL9qTmD1mUtq0/dY4MMoZ9
	pU+PF4eXaZUg1JW7idWVj+tMR8BvxgXJkoGHXZAldv0sDMxeJbWWoxEz1NL9d+6WFkZQnYC
	ObfHL/lbp9IyRiliBfTys5F3EZq/NIDMu/GTJri6lKmIVwC/jNbP70A/MHHO+b7OgOdQEDE
	9cos+lNIZ9Dw86cxmAU8H4QV6jITKpPTMPcPao/Dd3X1c3EZM5Vu6Yad56RlKep0ijS7HXT
	/4+f3kTvpruvd/R9i9NH68vhmH4i2VHf+6Vt4d0ZkzZc6kpLIrPImsVVxDncJ0dujKtt8EG
	Ki3aXDVoVBnRBauPb2KMM9UlcpXqpcciSqMuYccju7lsz5RQBGFivjwxVU56aMjBKuLv/fr
	yVLwCCcyGGoiQvaS4+l8EkXpXHEudfXQwgCyAFQw7RHNSlhOi/hGvXC/FSkkVXBiVCv+YE+
	G9Z/guufiX1OsWMn71A8ut7xId7Myr9NuM2AwPHUK08M4Yl+7NgqMDXwW1BRva+2om8swWn
	GiA+XwShgUOR8f5Jd2X3Vg/8InqTxLLLxnmikIWKz9iGJXaFFMNrCdY0myqjuXrkmbYUyj1
	bAP+/SqWN89I4c0O+8KUfu2gefQ/h8AFF5bdbes65vo3CaaVI3WdHG5UpHIKmcAay0B2Jnd
	H48V7DL5nPqZUyKv6J
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

Even though the narrower CRC instructions doesn't require GRLEN=64, they still *aren't* part of LA32 (LoongArch reference manual v1.10, Volume 1, Table 2-1).
Link: https://lore.kernel.org/all/0a7d0a9e-c56e-4ee2-a83b-00164a450abe@xen0n.name/

Therefore, we could not directly add ARCH_HAS_CRC32 to config LOONGARCH.

Thanks,
--
WangYuli
