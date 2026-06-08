Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CBC3A6EE9
	for <loongarch@lists.linux.dev>; Mon,  8 Jun 2026 10:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914814; cv=none; b=IG5TgQ5VFyJzCyWs6jrQEgsCLXgshjJEcyj7Rxdx2TkH/pbc+Vu71u+Cv2YM65yUZG05/byIEmrW88IMf6Z9Q1q45mt+TZRHG2iW9j7nrlsywu/tfVBqGPS0UweE1m2fFYSa8QLpdiAc/Rqo88wUZeL0jA0GlW7TD4W807BD9RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914814; c=relaxed/simple;
	bh=JjlAlVJCE9c0XkIJXeKE+yGMjHpTZZnWRH7KYMXEcY8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sfvCHluReiJyJu1BglsWN9cZ3XDlCPWHXzMmcGKxmK3xNdqB6DZrmDgew4USwdFJr3FV0Rl/TiDHQKmWU4zy2b8yw0QEObVDBdSY+73VtH5nF5/buaJBoiNQt6cVYzDHwPLg6g0i+/SNlXxo/AXZbs/ixYStZ8IPZldOmh+gZfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MSLcVCy7; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MSLcVCy7"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780914801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JjlAlVJCE9c0XkIJXeKE+yGMjHpTZZnWRH7KYMXEcY8=;
	b=MSLcVCy70d7TcQglHOpiEr/oEEmqOuckqA3y2JF97FPnzGLanhLg8bPxk4IDQ/oXzKuFMR
	iC97WZf2NT0Jw6mm9QfJPSMhFCFqeRKEuEpAOlXmcRblHsJZ57crQjwt1EnyxY3xAlpt0v
	0gDq6Hxeb0ZJ9jphiPC7fY4Fcbnseuw=
From: George Guo <dongtai.guo@linux.dev>
To: WangYuli <wangyuli@aosc.io>
Cc: ardb@kernel.org,
	chenhuacai@kernel.org,
	guodongtai@kylinos.cn,
	jiaxun.yang@flygoat.com,
	jikos@kernel.org,
	joe.lawrence@redhat.com,
	jpoimboe@kernel.org,
	kernel@xen0n.name,
	linux-kernel@vger.kernel.org,
	liukexin@kylinos.cn,
	live-patching@vger.kernel.org,
	llvm@lists.linux.dev,
	loongarch@lists.linux.dev,
	mbenes@suse.cz,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	peterz@infradead.org,
	pmladek@suse.com,
	rostedt@goodmis.org,
	xry111@xry111.site,
	yangtiezhu@loongson.cn
Subject: Re: [PATCH 3/8] LoongArch: Add special section entry sizes for KLP support
Date: Mon,  8 Jun 2026 18:33:02 +0800
Message-Id: <20260608103302.340456-1-dongtai.guo@linux.dev>
In-Reply-To: <20260605083839.67474-1-wangyuli@aosc.io>
References: <20260604065317.219777-4-dongtai.guo@linux.dev> <20260605083839.67474-1-wangyuli@aosc.io>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi WangYuli,

Thanks for the review -- all three points are addressed in v2:
https://lore.kernel.org/all/20260608100406.322598-1-dongtai.guo@linux.dev/

> Have you actually tested your changes with LLVM?

Yes, now confirmed: the affected files build cleanly with
'make LLVM=1' (clang). You were right that this had not been properly
exercised before -- the writable special sections were the real problem.

> BTW, "awM" is dangerous, pls see how did x86 do.

Fixed. __bug_table and __jump_table are writable, and SHF_MERGE cannot be
combined with SHF_WRITE (Clang rejects it). v2 drops "awM"/entsize on
those two and marks each entry with ANNOTATE_DATA_SPECIAL instead, just
as x86 and arm64 do; SHF_MERGE is kept only for the read-only
.altinstructions/__ex_table.

> And head.S doesn't need to include asm-offsets.h, it seems
> stackframe.h has included it.

Correct, removed -- head.S already pulls it in via <asm/stackframe.h>.

Thanks,
George
