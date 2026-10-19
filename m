Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792448349;
	b=ubSAWplCgmBNgWaEp1B841PKTqIcMhGMhCzNlwCFYy3CRsmgRUkpKI7p0gE5NWqIn/Yk
	 XohOfRYGnQX4kuIne090kOOd0B+JXVwBeUU2ZhhPitMiNXObRKIF44UAu3EAXXoHuOZCO
	 pYuGoFrCLOYuG+q3FVzoKcY9Qar2QQBVmPhCeC2FOSgeuXLZi8PoiLj0xBQEkmeLeTHVs
	 MqqmB3vTKc/UJ4YMYumXT/HYpAQDskyaS1gP6XMTOad8bWMCVDJy5wuF74XSBu6BR4Hb7
	 eRbWRk9XZ3rZwWB45Ll07eI/NqbD1ipTcD729Yihq5APFeA/ViN9g5+ZD+Xzrg+pdIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792448349;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=kOe4Im1LSzQe6YlhCXm9ZoEY1kfmGwsxFeEwr5kqbYo=;
	b=lsbi5df5eTvnB66RTFx7xV2u+ZKJUAGFWGe5Y0dNMQWXy19r63WblbNh9kGYPLXPwpoP
	 NO5pShhizcX+S4f9amCjm39Lptw1jw1oWLknGugvqSWjg+FuM+WThdPY4k0Rjw7+KiU3Q
	 KIWzN9dyk7XZH73ajNFRB14WqhXg/Mh3eoWuePB7MoTmSf/uriLOwy1OwGtmBbQYFhhr4
	 tZwGC2zvmb0jVQKSvZ7DAdAZJ2pzCZ4rAa93MS2V2Uv/+J9MfxoAdAQ6dMAi49c4vZrfa
	 f1cbA7ADHtWryczU2AIZjf4lc28HU0dFYVTABuHYJqWqm2Iu06pxngeLhrUv6yt/YfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=RCmRXJyx;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=AetS436Z;
	arc=none smtp.remote-ip=103.168.172.155
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC499606A31A
	for <loongarch@lists.linux.dev>; Mon, 19 Oct 2026 22:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC499606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=RCmRXJyx;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=AetS436Z
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EC1FF14000F1
	for <loongarch@lists.linux.dev>; Mon, 19 Oct 2026 18:19:07 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 19 Oct 2026 18:19:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792448345;
	 x=1792534745; bh=kOe4Im1LSzQe6YlhCXm9ZoEY1kfmGwsxFeEwr5kqbYo=; b=
	RCmRXJyxqEdtgqqTPG5ZmqHjdH8E5bq/K9FxPFoyz8jl7GlkI3G+gUgvqij/VJR2
	YOxbMGBPOpW+636UErWUQdD/20DxsOwdt1Y7ScyVnrDLIgiT+R5u8juNyg17iThN
	uOKKSE2sOKr70UN0/qjz/T7rrUZboqSq1ndeQD2HA7Am2oBM5bYjNcgw1aqw18Jd
	YWzeBhlZXlccMeQewWEwpB1PrHjUkbHV5nhM68dJ62cdW2l3jOo6DYGXPdqcr3PI
	Yy1pACxMwIt6fYTnNAAAZO7359dKdNcxSlMxMsZEzVRu2TNkeG8/OVY0dGMuZZdM
	SqvbIv4VOTw6e06qhNnLfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792448345; x=
	1792534745; bh=kOe4Im1LSzQe6YlhCXm9ZoEY1kfmGwsxFeEwr5kqbYo=; b=A
	etS436Zh8qxtYdaU/CJq/i9GBjIwq2B9kYd0kXxye/nNgLvgVP4LVV4xXuFxWtoh
	MxmO0xdBThsUjLtI77Sp4WT+2AyIpNfFfBxFOm3rQMMG4rbvOPUY0ItG+iORdx9N
	XsGL1HNhJSuEmBLvzmNWsg1ld/kVvfJ0Gs1Q8ZV9TTHf6F7DLMD1pb1hF6e9FTgg
	+rgyqF1S/wY4+FppkXzTmlfJWIXULOvsFcxeiKlSCwFzbGx784AcyVUwKRnsrRs+
	dvUjx01nF8XakEYus1XYjCN1h9mQVebnMeJTWTnGOi2SHuCBUcp4+VhfGgF3l3G5
	yJhkguc55ho2Jye0UqgFw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792448345; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxvb25nYXJjaEBsaXN0cy5saW51eC5kZXY+;
	s=fm1:rsa-sha256:Q8g+p50hMwRQGq9RQz/RQOaIawfsKjPgIZsF/JjfyyKrPG8
	0MdGhqbzxrh2+7WiHgaVTogn/3thPczL/PBrAxE6ByrPHy7N+BkUSyOZLV41Tsmz
	I1l8gl6FVMz+1laTdpDWFHO5pOyvsTa810w2265gIhys1hjXE07r4/Lu9/uf+mtw
	eMIbyOPDbiQ8/dA1rjinj+zRV+EZRhSalZhpggDy34do7AOWvOsecl5DgP6Mhn7f
	+bnNbU5Ae1JoBDEu0UT4r+GxnLCNzcomkx2fHhzjhnYAteYJxAN2aEVRbHB5B+PH
	XiNK1jaAYNGkTz7UQMV3sSQcX3BDrK15K1NqpVA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:7qFSRCKsAm2ZfSbhMkUQBP+eGmVHB8T4s0OQ32AUg8A=:DUipovr+RJ2NSjtSSx+bpSGkCWo+ERoIpLldzN+AaDY=;
X-ME-Sender: <xms:VJfWaj_uYYTKjZkWENXQ2wAZ69kOIyboHP8mAT4Q0uU6boJ8igX9zA>
    <xme:VJfWaqjeYXlD6brTZepS8cSOSEWp4301iECxN58JyMRKLrJ2jmwmgBLPbQL26ywJs
    FkCv0HOtflgB8bClfSmDhIDGh80dzdypLU3LlMWO7x8S3qUzIiyvm4>
X-ME-Proxy-Cause: dmFkZTGh3VcsoUo+kxXucaKvj9NoR1JkiHcqPaFchknzDs8G+4FcZMoWxMdEK9h+JTCaQH
    Z0o+iZ7kqFp1/FeuSd/hVwSC2CANsSzc1m82zVf08of7YujL+yrRS1BeH3yO6VrCu+jN4b
    5JXMc4eFLv+T2BngkIjFhgsthO3ySULh7s4u6PfUSXf662GOO7gznJ/GTHJR7vtU0q/RKZ
    bk4MSREmjwp92vZg3lfiVNmCJdYAvFbByDZzj4jUDiu41HtP1lh2D0O9Sp+cUCPA3l6sEx
    il1SySS23YThltlWe9KAs8xi1QH/XobMxR5IlB8X0tKbQvSwWwDhwN58wwePu8cjh4z+YJ
    oLyQZMlHV2UFNyp4xkZUi24JAIzqWV0zwqe5OdafKAkiuZQNmur02epshKZAt71JmE3nLN
    605MrmutubwQzlJboxFuimDybjjW5Z4zm14HhovOMvacWSaKMkcvc2ImJCJVChMyyVd9CM
    epMSI2h1irIolRT1iP/nAXzlLwVK9+A3GSKxtbICTKA9fHZQ2NPakkRaSuDuPzewAb7kat
    pOLUAdZCVxPMwBYn4GXywRjcuxsnxc55Op6ZOBfO3u896Z5IoUhlKQGVYPa3apYx4JT7N0
    JY8qIGBJjaT5xXq3jz/dqcb9CWF48XWkmra70nVVHc2oOscJOOFNRdaxSRng
X-ME-Proxy: <xmx:VpfWasH65rjYJEkR4NOWLCJVcoEb07yaH1AkK8UvkzE6w-_haydRFQ>
    <xmx:VpfWahKVv4ThIn4DEaKscH8nYo2e7JREt9DeEkjliGYtpBzoS-8lnw>
    <xmx:VpfWahjeaXaIbjWRlDK64oOq3oDDOPnb2Dg2peifQ_QfnvHeSHW3Iw>
    <xmx:VpfWanlda0k5GUmABGLeF7WHUhqD9xCFhZZRA5xM9TRHr5y0qp8TyA>
    <xmx:WZfWavlUEeLDUmegjPy5QQRf93bbwcrM8ctROfKm98GUEijmSqhLkLkK>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id B173932A008F; Mon, 19 Oct 2026 18:19:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-ThreadId: A2vF7igrjTD-
Date: Tue, 20 Oct 2026 00:18:39 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Huacai Chen" <chenhuacai@loongson.cn>,
 "Huacai Chen" <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, "Yinbo Zhu" <zhuyinbo@loongson.cn>,
 "Xuefeng Li" <lixuefeng@loongson.cn>, guoren <guoren@kernel.org>,
 "WANG Xuerui" <kernel@xen0n.name>, "Jiaxun Yang" <jiaxun.yang@flygoat.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 "kernel test robot" <lkp@intel.com>
Message-Id: <e9489def-3fd1-48c7-a042-98395a3d1589@app.fastmail.com>
In-Reply-To: <20261019144240.4035274-1-chenhuacai@loongson.cn>
References: <20261019144240.4035274-1-chenhuacai@loongson.cn>
Subject: Re: [PATCH] soc: loongson: loongson2_pm: Fix build warnings for 32BIT
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Oct 19, 2026, at 16:42, Huacai Chen wrote:
> Since loongson_sysconf.suspend_addr is unsigned long, use "unsigned
> long" instead of "u64" for casting, so as to avoid build warnings for
> 32BIT:
>
>    drivers/soc/loongson/loongson2_pm.c: In function 'loongson2_pm_probe':
>>> drivers/soc/loongson/loongson2_pm.c:178:49: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>      178 |                 loongson_sysconf.suspend_addr = 
> (u64)phys_to_virt(suspend_addr);
>          |
>
> Cc: stable@vger.kernel.org
> Fixes: 3d9aba6618d1 ("LoongArch: Adjust build infrastructure for 
> 32BIT/64BIT")
> Closes: 
> https://lore.kernel.org/oe-kbuild-all/202610190549.WM2PO3vO-lkp@intel.com/
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Feel free to pick that up through the loongarch tree, or send it to
soc@linux.linux.dev if you prefer us to pick it up through the soc tree.

      Arnd
