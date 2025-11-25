Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4E972617
	for <loongarch@lists.linux.dev>; Tue, 25 Nov 2025 08:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764057672; cv=none; b=n8yrN1dZEXKN51GBATZ4RjlJyqAzLJ2HGaszUsGVMNKGoWySu+90ZmW0FAmCuzXzwt1MP0U4F2nZcWct88dm7AsTtqjxSUbMNKuVFbbgZ70/KsElBYKgl/PRS5v1LhMuryFnIWZhMgwO6v7OxkL72Rl1lr0AflxZjFZomn/YfcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764057672; c=relaxed/simple;
	bh=8BrNhyhVfJ4iuUz29GD7wyqyF3JUH6lOd4pzAnc/v8g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NV0ajYCiB74eye7IBY5q3yw1+0XKgV4scoP5n/RzMHbqaznqp9GGMsMPQ+ZPxEVopVaCvelPleZ87NAuvs7VUB7IvSMcXwD84cM20Ft574acYJ8Wj757/8RWnnQtY9HTAC9umk7/IWCEg2Bw2ICWjwYZsCJ/YeRqVxSj9z65ED0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=EJW+epP0; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="EJW+epP0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1764057668;
	bh=MlytAwihPr4a/q9a3aU0p/eP4Aep0T+K4h3bQVMgwkQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=EJW+epP0wPt+yJgtSlSQv0LUiXtaL10Q7BaamVVAdIN7yIxfkAm5t6ZxS4pZEmaJS
	 SiI6Y+VR9sGnOfQJZNig/33q1wOj8L2P+2rrcr5V8WvAcfcR5M8NobSrMxST0TmW54
	 JcLhR+OSVeQwNY1tLl52mcyQN27wiXvdclDIkauo=
Received: from [127.0.0.1] (2607-8700-5500-e873-0000-0000-0000-1001.16clouds.com [IPv6:2607:8700:5500:e873::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 03E7C67020;
	Tue, 25 Nov 2025 03:01:04 -0500 (EST)
Message-ID: <c775f4835b13ad2245e33afe740fb380a481ebd5.camel@xry111.site>
Subject: Re: [PATCH v2 1/2] LoongArch: Add 128-bit atomic cmpxchg support
From: Xi Ruoyao <xry111@xry111.site>
To: mengqinggang <mengqinggang@loongson.cn>, George Guo
 <dongtai.guo@linux.dev>,  hev <r@hev.cc>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, George Guo
	 <guodongtai@kylinos.cn>
Date: Tue, 25 Nov 2025 16:01:02 +0800
In-Reply-To: <b5de6a2e-a700-4687-b483-2d60e309de25@loongson.cn>
References: <20251124-2-v2-0-b38216e25fd9@linux.dev>
	 <20251124-2-v2-1-b38216e25fd9@linux.dev>
	 <CAHirt9gjjULM6CGDR2pHJkQAKMsoZ8kpqtPn79psJQP1uu6FsA@mail.gmail.com>
	 <20251125104316.00001294@linux.dev>
	 <d35ea927d520569ac8b7482f5fedbe916005ff83.camel@xry111.site>
	 <b5de6a2e-a700-4687-b483-2d60e309de25@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2025-11-25 at 15:34 +0800, mengqinggang wrote:
> > I clearly remember when Jiajie submitted the sc.q support to GAS
> > Qinggang was really insistent on supporting the additional ",0" here.=
=20
> > But I don't really understand why we must support it...

> Because gcc output=C2=A0sc.q $r,$r,$r,0.=20

At that time GCC had not started to use sc.q yet.  Some unfortunate
communication error, I guess.


--=20
Xi Ruoyao <xry111@xry111.site>
