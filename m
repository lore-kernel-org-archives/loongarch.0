Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF8D39A06F
	for <loongarch@lists.linux.dev>; Fri, 10 Jul 2026 07:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783669762; cv=none; b=m974/x50UAQ173WPpMe6duCpNi2mrVTHbdLDCNXH4zcEE9Or6B0cv2p+g5G4EKRlutgiEjL+CIAaVHaxmSmJrGmE/w3gxVjiKmDTm/GqUsxiNK37Kuh0sdG7ikQSf5xeBq2Vpg+QpxKbxYDiOwrgSOZiA6mJQ26RHfYTET6dj1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783669762; c=relaxed/simple;
	bh=ATtcFHVILuwhxiuVHOtYpT89mQVo+LwTBA6qFD6jsOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g20RDU1ISUWnjUKI9IDPocQYy5fYz+1oPnNvX+k1F6xMssTAp7EojtBS11uG2eqdOPKbUnuZFrgJHTQqskIPYbxgLChH7/HYmAVaYQZP3naz0jWMgQgOapzYsNXEBZQ8MK614FtBSbx4VHPxRqMI63NixjHP6dFfL5JZfq26QMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GjtLbvgC; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GjtLbvgC"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783669755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ATtcFHVILuwhxiuVHOtYpT89mQVo+LwTBA6qFD6jsOY=;
	b=GjtLbvgCAEf3UAHx9VTQZOPDszDuigfoOiCkuDYPQFlHw/q3x9MaWqNQAZAX/F14PiL1OA
	IDTpGoChGCw51L1SI7anL4wU/TWMcBZXL342Zcd4m2+Z25uOJ0BY6vWYLan6D0yMHhBIYL
	QxcL2HrpOLgIjYLMpPunZ1zR9oU00DE=
From: George Guo <dongtai.guo@linux.dev>
To: joe.lawrence@redhat.com
Cc: chenhuacai@kernel.org,
	jpoimboe@kernel.org,
	peterz@infradead.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	kernel@xen0n.name,
	rostedt@goodmis.org,
	ardb@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	yangtiezhu@loongson.cn,
	jiaxun.yang@flygoat.com,
	liukexin@kylinos.cn,
	guodongtai@kylinos.cn,
	xry111@xry111.site,
	wangyuli@aosc.io,
	loongarch@lists.linux.dev,
	live-patching@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/12] klp-build: Add LoongArch syscall patching macro
Date: Fri, 10 Jul 2026 15:49:02 +0800
Message-ID: <20260710074902.27569-1-dongtai.guo@linux.dev>
In-Reply-To: <ak6ibxwACKMK8it2@redhat.com>
References: <ak6ibxwACKMK8it2@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi Joe,

> Nit: The other macros in livepatch_helpers use tabs to pad out to the
> line continuation '\'.

Right, I'll pad the LoongArch macro with tabs to match the others.

Thanks,
George
