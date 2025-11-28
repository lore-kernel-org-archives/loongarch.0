Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2721C701F
	for <loongarch@lists.linux.dev>; Fri, 28 Nov 2025 13:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764338270; cv=none; b=R7MgTNs1IfHhnX3l9VhVvmCkElxvMKFc96LXofljbeLXthPk9KebimX3bbU9FOXHiI9KN99CPD2NhCtzpwROSGAgAggrw3uonyr7yCs4+LQBex3RDy8GBxreVSPUCOmBnyc7B9YIZLfSeE9iDXjiYM1cvZqZ9kLFc0SEAnwBM7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764338270; c=relaxed/simple;
	bh=zYUiHN25oyxu2egvwr7LSF/61aPv09Z0QZ4ddPeOqRk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=lrwLpMyhW+P2AgrSnZ3k/uJcTsq/AyST3e0sS2tdaXxSn6iBNAyAyKTFpBKge3sQXihCo2lGAI6idKx7TXQxNckdzIDgmRzRJojFcMw7QtfrG4ZHkTCHDajPfP7mpVUYZhRFJy/NtzZgA0BK2+uZlRdmULYDqmXdkmxg7RSWtus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=X5oIbpaG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dUKOislP; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="X5oIbpaG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dUKOislP"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 992231400183;
	Fri, 28 Nov 2025 08:57:47 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Fri, 28 Nov 2025 08:57:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1764338267;
	 x=1764424667; bh=OEv2M1lBrhNa2S71O5/NuZERW1Ws3yg6YFOCC6w/KrQ=; b=
	X5oIbpaGYbXCfSnot/BvvYQ4ug68656yknEJv0clp3zNW5voXVhWPZnykub4LKuA
	lOe4o+Xbna+A9nNMM9g0FptWeQVFUSM9k9eXETJ6yAg52AM+Aa9SUP/B6HN3Zzr4
	yhliqqAvi7rQgKMoWAUn8ZjBUY2McDCYagQ0YxNO2G3AfQKE3FOJs7fk+IujH8VZ
	D9yV4ETnuyND5FLN1TGW18S44CC/DpgpuEWOixx+FE82NMDldy/OkhOwp8zYmGmw
	hlE1fQOWj9Ov/c1vDBKvSsP7uamfH/ovElN1VuPVqm+a3GlspQlPPd1xmDl98hNf
	58trjYg/wR8f81uZgUz5qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764338267; x=
	1764424667; bh=OEv2M1lBrhNa2S71O5/NuZERW1Ws3yg6YFOCC6w/KrQ=; b=d
	UKOislPBiKZVIGgC/0E15cTXZaJw5j/FJalkdgnGrwURjHRZwAGEXbQ23hg3AoGl
	PHJZVZ24XV5oSCAD4g5wwM+wd5xzU1fK2fQPZ3uf8OxHweFwOgjYFB8r25Rxgqun
	7NBAmDVB1Pw9rMnPTak67djUd+uGt3hlzgCzjaZIVKeAWE0lyYHYe+hokDWZ4slM
	1j+BDKLh3gGzXYXp9ojqyIA7SjiimVLWOIootz0WQJowSoH1dAiXHbv9ZZ2nTQXa
	q7/v0NjTu5y0lEUeeBhJh3g2G22oG2+vEPncv8PxsOBA2U7YWCL9GS9SNj7rmcRp
	yl5xdHo4plE6IljPBNT3A==
X-ME-Sender: <xms:Wqopaevnyep_K6Vha9hJjc_jx9CsFpvT2LB2eOtqNwWLFS2VnhtN2A>
    <xme:WqopaeS0h9Augp8r3ZrjnhzejdsUw7m_tup0Q2PmdNe4MtE-zfG7_hd_12oJvVqxh
    jdhuVVkSipNI7E7F-4Ap9fMD0L1rDA5rKVV8pH7nq1Fye1rQ_B5VQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvhedttdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtph
    htthhopegthhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhu
    ohhrvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlohhonhhgrghrtghhsehlih
    hsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheptghhvghnhhhurggtrghisehlohho
    nhhgshhonhdrtghnpdhrtghpthhtoheplhhigihuvghfvghngheslhhoohhnghhsohhnrd
    gtnhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehkvghrnhgvlhesgigvnhdtnhdrnhgrmhgv
X-ME-Proxy: <xmx:WqopaaMAalhIpmlNDKrHfrD6B229CTw6rpZa1Zr10zKU1_qucwPZuw>
    <xmx:WqopaU-1sLKRZetEuT9HObMStV442sbyXq3fY0D1wsJsKMtyHAg49A>
    <xmx:WqopaTd9uQGigHRfYrKGVkAQTMjz0C3DY5xLxglRyNSYYbe2nG1N_w>
    <xmx:Wqopabya4bU6dvTwxamLBtHt1AHXgDzZi5KvYF1qr0uRu_LBxDGxFg>
    <xmx:W6opaeb76Kd5ip5f-HEtDFPHcFJIPl0cGUupbqofagi7L5Cq7RgBc6np>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 542BCC40054; Fri, 28 Nov 2025 08:57:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AV93MsyROXIc
Date: Fri, 28 Nov 2025 14:57:26 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Huacai Chen" <chenhuacai@loongson.cn>,
 "Huacai Chen" <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, "Xuefeng Li" <lixuefeng@loongson.cn>,
 guoren <guoren@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "Jiaxun Yang" <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org
Message-Id: <12520d82-d858-4067-b9ef-baddb596ee56@app.fastmail.com>
In-Reply-To: <20251127154832.137925-15-chenhuacai@loongson.cn>
References: <20251127154832.137925-1-chenhuacai@loongson.cn>
 <20251127154832.137925-15-chenhuacai@loongson.cn>
Subject: Re: [PATCH V4 14/14] LoongArch: Adjust build infrastructure for 32BIT/64BIT
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Nov 27, 2025, at 16:48, Huacai Chen wrote:
> 
> +config 4KB_2LEVEL
> +	bool "4KB with 2 levels"
> +	select HAVE_PAGE_SIZE_4KB
> +	select PGTABLE_2LEVEL
> +	help
> +	  This option selects 16KB page size with 2 level page tables, which
> +	  support a maximum of 32 bits of application virtual memory.
> +

I just noticed this inconsistency: the text says 16KB pages, the
option says 4KB, so one of them is wrong. Usually 4KB pages have
a 32-bit address space (using 32-bit descriptors), so I assume
this one is correct.

      arnd
