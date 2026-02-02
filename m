Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B2EE55A
	for <loongarch@lists.linux.dev>; Mon,  2 Feb 2026 01:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769996218; cv=none; b=a7HYPyzrzGY1LzwTlX08QjEN82T3VFoTN6ZCWuj2UfnxijgkWDpoo9EM1T5yvc45k97/Mq2abT/6UhMxlTULbe9xYShq9cdlHEEVNkWClaIw3Fo4txRpLh2k5Yyp2B7l3WYHALIFk1iJQFqi+/OT/pCZetktBG11ziTT4gY22Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769996218; c=relaxed/simple;
	bh=ETZ+62J+NEaiIT2xIi7QLCl79Aw4vvIfnMq2tEMZXZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Go+0hJBqlGuqz6a9dvdxLWDZSN3pTqEG+/thvh9dQcDZxdTPU0a4cYlgwQW6yPLmhg7eqQMNfG0T7lbVbiEo/nUOYTtpPvAW7SBp3q4pO6zA2+bUg0d64PC8eI1etWrJrzZ4EnL/eKJEnJV4m22JU8QtmjidTwZIIjHipzKXp7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IWd83D4K; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IWd83D4K"
Message-ID: <524246d9-bc9b-4d65-814d-d544b53bcd0b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769996205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ETZ+62J+NEaiIT2xIi7QLCl79Aw4vvIfnMq2tEMZXZI=;
	b=IWd83D4KhaPIx+Dj979Nf3QydeIapFOGLD3toXTVuMqcMaNURbg6LL4gnfLt6wvJEQeaY4
	9jGoskxMncIe8lwAUoOE881b6RI330dT9rCiMPIfI2ZD1hPYBUN+Z75SknEWLeavDjnqQy
	bCbZ58D5MeZ9slbFKKqJgQoYDrjRpGU=
Date: Mon, 2 Feb 2026 09:36:26 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: stmmac: Correct spelling from clk_scr_i to
 clk_csr_i
To: Huacai Chen <chenhuacai@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Serge Semin <fancer.lancer@gmail.com>,
 loongarch@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260201023619.366505-1-chenhuacai@loongson.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20260201023619.366505-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2026/2/1 10:36, Huacai Chen 写道:
> In include/linux/stmmac.h clk_csr_i is spelled as clk_scr_i by mistake,
> so correct it.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

fix tag?

But this is just a comment, no need to backport it (I'm fine either way).

If no fix tag, please update the subject to typo fix instead.


Thanks,

Yanteng


