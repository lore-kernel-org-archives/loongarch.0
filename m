Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286022;
	b=LJSdWpgDTyeqs6Wyuqbr/kllv0DMesMCwtGG8YJEgcWmOh0+jJzXrW2+PonQmUE7xILq
	 JP3DcTnDT25LaPMdxXxZLUqqxh6T+rUUnntN8KpJzh1tVHzEKrEToASXqsrlyaXWYhZNv
	 sax9LlHdmVzdNpNiO5Ha46YhFqHLRpOXQQNjCeRhe745+rA4QW9N+nqNuqM2VfexCZ5Nb
	 YYCE/ygVrhhvLe+m1syuUIeqATlSEVQTbE4YU/yaejhNOp1iyJEPYocVH9QvSWdZKPkaO
	 MSCJMv/Z54fxu8roN1CPNI7PP3Hsmzu1PzbfQTSFgWLcBO8a9sjfDxVxBwCaMKqNe9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286022;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=qeHwILNQGply0KqQmlcAkFwCx/TwT+bJHyeDxiQI18U=;
	b=4XjxFsq2OOgNmixSYs87sj0vAyKN0xfBvdqo1xpr3Q16zPSM/mg2JoQWn4R6zrN5Ha31
	 LN5xw8sdBdGmEWUKWJGBYnXtoSfLPXNsuY5HPVF/lT1GSr+L/yquB9uP6XIJDke6Gk9wv
	 UOMN2ZnYLWgPByeZVQdvc6GN+6pUk5TaznV9tSMVio1JpNE1hTngTv4hRGa6Pi0Jy2rNf
	 9rnPygoq6S2m1FCg+HVweYC5B/mHRf2JcBVWt8WFzQHvqazCJbCZnlfZwLXA25jLGXiVH
	 sWOGxX2rSzMPLeAVgc3tbGzWezeE3gQpylzbZb1T7uZP/tTC9cZUDKNCWRllXTi7ofg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=WrT1BvF8;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=WrT1BvF8;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64778606A326
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 04:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64778606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=WrT1BvF8;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=WrT1BvF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794286013;
	bh=ZB63gzCuOHYpjLLMilJz9otldB10xXorS9YPyJ3fmfE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WrT1BvF84pm5hCTmr5G04ulNCFZToyJ8qH1j+W9zQI0i2R1GZl5W13R9u9R0TQtP0
	 6/2DeFbKxSj0iSU2mNyRHIM8heTSSjK5DDWIoclxdkiHSqS5RSEgEsb/n+i9hxNDhd
	 VIQ4eplV4CHMRcgRdQBDYNs59roQD/YX9aE2LEibl4mGyHSSD530QZw657S6ttedEF
	 oQVl3d6m2zgWEilUtdpMOoGqH+Tbpr01PCYnURdcBwmu0NS/FyV0WYv/WAXpcVuHKJ
	 41GHSJNbw6dtHlLceoC6JWJ2Iaf14ySRqN9WUYW9vs2t3uqIRm20AVXV4FIKWTbaPp
	 oCKLBPuBTDG3w==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id C5FAA48C15; Tue, 10 Nov 2026 04:46:53 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794286013;
	bh=ZB63gzCuOHYpjLLMilJz9otldB10xXorS9YPyJ3fmfE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WrT1BvF84pm5hCTmr5G04ulNCFZToyJ8qH1j+W9zQI0i2R1GZl5W13R9u9R0TQtP0
	 6/2DeFbKxSj0iSU2mNyRHIM8heTSSjK5DDWIoclxdkiHSqS5RSEgEsb/n+i9hxNDhd
	 VIQ4eplV4CHMRcgRdQBDYNs59roQD/YX9aE2LEibl4mGyHSSD530QZw657S6ttedEF
	 oQVl3d6m2zgWEilUtdpMOoGqH+Tbpr01PCYnURdcBwmu0NS/FyV0WYv/WAXpcVuHKJ
	 41GHSJNbw6dtHlLceoC6JWJ2Iaf14ySRqN9WUYW9vs2t3uqIRm20AVXV4FIKWTbaPp
	 oCKLBPuBTDG3w==
Received: from [IPV6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb] (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 9EDFD48C07;
	Tue, 10 Nov 2026 04:46:52 +0000 (UTC)
Message-ID: <64d05861-c4e1-4506-ac2f-4109f1062932@birger-koblitz.de>
Date: Tue, 10 Nov 2026 05:46:42 +0100
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v20 01/13] phylink: Add phylink_mac_interrupt
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, linux@armlinux.org.uk, andrew@lunn.ch,
 hkallweit1@gmail.com, chenhuacai@kernel.org, kernel@xen0n.name,
 edumazet@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 neuromoments@gmail.com, beganovic.emir@gmail.com
References: <20261106-ax88179a-v20-1-37b5a1189983@birger-koblitz.de>
 <179427470922.994134.16776316201780098943@kernel.org>
From: Birger Koblitz <mail@birger-koblitz.de>
Content-Language: en-US
In-Reply-To: <179427470922.994134.16776316201780098943@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/11/2026 2:38 am, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] phylink_mac_interrupt() (drivers/net/phy/phylink.c:1629-1637)
>    loads pl->phydev with no lock, no RCU and no reference, then calls…
> - [Low] phylink_mac_interrupt() reads pl->phydev with a plain load (`phy
>    = pl->phydev;`) and no lock.
> 
The possible issues for the series have all been raised before and I 
have answered to them, some of them more than 4 times. None of these 
answers are being referred to by the AI, so it does not appear to make 
sense to provide such answers. Asking nevertheless to answer them again 
(all medium and above!) constitutes harassment in my eyes.
At this point I am asking a human to intervene and tell me whether 
anything really still needs to be done.

Birger
