Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427114;
	b=FkIu2eq1VsGpqmnXhSoKHlaFC59h9XijL6IWQGoJc7P0Pqf+UzkrWCRPqq4yqTknoLqD
	 VXUeiRoMPFfZ7j4ZaufkGKjIStwBX7V4mW5L2AQa69yInc1iBtdkCoWdF3B/enYHQM6FB
	 gX5zWqSYiDDmXEeBpgwVvVBNkedLdGnMd48g1vO+yzacuebMJJoJ7g2Qqlxz5tIN6ysYT
	 Qj/VpH5+E6tHKSjYjwgB8xljSJ8Xxy5YV+82bUCvJHlIZ4FnZZ3lKELgBeCghc+HYo3nm
	 hI5hD+09yoUEeSirfQqIzPwgpsLfggat1/h7qj2f6lc8Oy9UFxPXk2QR8jSn9DNmazA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427114;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=Jf6Sqoi3Qn0aJKe116rFzx97I+WLp3H4fMEI81ndjOw=;
	b=vJWyUm+HFG4PQEMfBXS/zhRQPVihlRkvoHhox9rVKE+Kjtg9GAQhc/l7z8egRUzWtKCC
	 zLjmVD7qc1Q3BJnxvsw0XV7foFuUfCBr1SZxK6RAjVneYnDN/kwtrR6yY+aUqlBQ3q4tY
	 uikn5uGzCmxiUSlwfdQsLMS1g+6GqgUMPJ7MTyPnRF9ib0xpnfd6Vp5FGJs/yymL0Kqjm
	 06oZViky+DAz5o2+w2ki+uurRORfmV5msrX8UhmwlA5W+a/yJpeBtGf6cUVPQSq60qTu6
	 AAcZQyT9u1pGhMCbSgxuG5sIwEiyDULcywEwghJvK89EvS7nt09cili770p7eKh4JGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=O7AgBIDQ;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="b/xkS61/";
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290A7606A336
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 09:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 290A7606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=O7AgBIDQ;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=b/xkS61/
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id F2BF8EC0AE4
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 04:45:11 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 23 Nov 2026 04:45:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795427107;
	 x=1795513507; bh=Jf6Sqoi3Qn0aJKe116rFzx97I+WLp3H4fMEI81ndjOw=; b=
	O7AgBIDQYiGEwcU13yBP7pD9SSA2LG3Y/2zfedNLAskwZiMNiVx/3YiRQCiif00L
	KR7wbkQkixoe73zVJ1Er/fxNvlv6oup5Qs7tIFLBQvXHlNf2Lls/CBhsRQAvANrx
	vUnwgy8YyeKjiP9KtWB5j4f+P5wk+IKDzKMPufgsh1nSdormzySXKWxUMBRzZLP4
	HbZufdcYy1Pd6Ly1p43LoHR+3Vb0Qwnx8PqLg6abpEKgj7bS8ALsGmKzkbvNFBXa
	MiwlM30/oy4VCzbP2D0Cn/RvckE2/6m1FYYRZEehucfMzUofj1hrRnSQadQl3L8k
	K8KcORqTkWAcvTDrUnGBuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795427107; x=
	1795513507; bh=Jf6Sqoi3Qn0aJKe116rFzx97I+WLp3H4fMEI81ndjOw=; b=b
	/xkS61/kMaSQuNIi8DG0o5vUJAH7d6Q1xIk97skI5kwzb7tPoAEfcUn2XJqOMww4
	uf8Sh9s1OXPn6LqvXUYfgtWz+icscUJeCIALVZo6TozAZu0w7OG8m6ae/YqfUECg
	k4juAs2ogTO8ctEgqAPm3vFT0ppNeEeqIgPHEcEBLM7hm3pLpXsXo5QUVdFEP1/S
	UkZh2vllQKqkeLfF4kPo9CKZj3Qe9PIXsR15BgQHdGjzXIRTIQBO6ZjEDE6EU8MP
	X6IKLwE7y81JcCGVdMF0ste0Er3Nm+tWTxhbFCV4yRSDgl3CK22qv3rqFc404Pic
	SmeAIHQMNgJ5z33uvvV5w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795427107; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxvb25nYXJjaEBsaXN0cy5saW51eC5kZXY+;
	s=fm2:rsa-sha256:O5/80IrSenws6liqzd8tkP0vhKgxFn7RngJBYSO4LPNOE1w
	EeJgm/QDK7cHcTBWSAPkWETJ9NoTd4bN1V3AvayuY2asL1wMerWwrG2fjns6BfBa
	mZ14PsubkUX7z8uxh1FVdOqayTWhf8r0XrV2exzMCFY2CRx1yqyeNJIO11a2P1hq
	KZoJLYy40+qFxcCiSEKR0tJF5vtJj3bDn7/260dvPhKOUtHxxwGGKezxacmFOtlo
	GeiF6S9qLD9boWOKYRvKCsCI6DTm88N/y5CBlNra+UZUbS0hR9Zwq3CQcaYOu4dP
	MdGKvVibD2Wl3e/lhIhW5/Sx3XLyC+YSivyFDjQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:n6aZHqmDv56bF8XRSZatVJoaf2cIxLxzDgGBelOCUhY=:k9xBw4n1GQ1b94YYLMbzPhZvmLufZirlyqxW+aNOye4=;
X-ME-Sender: <xms:HgsEaxOhIy6VSqHjWAAc5S8_-r6-9swBvBxAZEerTD2O5jLd3ZgG0Q>
    <xme:HgsEa-x69Xr14wICuR1V3aldkqPMHk8AQ7qJe2NS-7QWty46aKqak2PekFIgToWpz
    PoRPYsUtqMhT7VkM1ce2MJx0QvsB3KlJ6zaH6kNqLo-5eQx8qKiXe0H>
X-ME-Proxy-Cause: dmFkZTFpjowEKf6THSkdHWlNfLsqi/vZ5GVMYQLFUxpmwMKx15Gn0GblHHreGqWlNSZRJ3
    6Stix52GCratCpj/7n/ateu49JFA5AjKZNwJ4R9VBgrMnT1kWC9uZL/57j7guCkzp/axZj
    7i8/C5KOfhgQ77XKEjot0lXHcH9w8HKqAMH3Sqehj7oZCfsAqKXpP+uFG+6U2gp4T7mAIb
    lPd5PSTOjznfw247G71MJjn0c6a6ZsMiXUIGFEjVlndXWZ8kMdo/fyAm2Icr8OU41WdOww
    82BaQor6puPLTTo8KDZD6rQ36OvbXVnyqY5z9bIpYMFPhmT2b04eSG2J/h9UtsImG7IdeO
    b9w35fi2So7GFHUgGGCEXxt5oRewJYy8gfT6oAfvi4NLlTPiFtaBawQqb9/9DoasICM2/w
    ffH5NjKuoyrFGXpYfuE+zqEYHhuPIItq0tr7E+LmfnS8/tixEooc1ShXYR6S8j14tfzbXp
    vzLQaphfQaLAl5/NnHlEV6SaEXsvOlJQWNvupyJHK6sIYHYYMIwHwgDnRF/ICBQvKO5/JH
    dPz6PlKvqNhJMc/zq9fkS/kxOD5L+5/9q7vlw+ymavddfSFaFBHsZ+E8RK4GE5ANtYShX5
    t2Q81Q/mVgdYPz2HP2pupFNyQEvOwqpN0/DPYeMPIyxKE8Px19JhQ9r8FMaw
X-ME-Proxy: <xmx:IAsEawGGTpdHb13lBvPvA-EMxmxgd-z86XmyBfAQKnW2yo2D4hi7hg>
    <xmx:IAsEa-PLkdycf7S3rOl8FXT72ZX879GL4GOYQl-HDahX_Sv_GlAI5Q>
    <xmx:IAsEaysK0ulq58o5gOXQVpwfq5yCaWkpgPWJ1er_z6kFjW2uDX6ikg>
    <xmx:IAsEazVFOMlr6GbbnLAYYQyoBUp3w7jHyHBXanRly9aDQskU-2q8Zg>
    <xmx:IwsEayan8b1DSh4GdNFijLjU6RL3T1AZo6Ww15949JvjYP7Bm8s6GjOk>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 32C9A32A0099; Mon, 23 Nov 2026 04:45:02 -0500 (EST)
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
X-ThreadId: AMjdjL9dYp0J
Date: Mon, 23 Nov 2026 10:44:40 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Kees Cook" <kees@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-alpha@vger.kernel.org, "Paul Walmsley" <pjw@kernel.org>,
 "Andy Chiu" <andybnac@gmail.com>, "Magnus Lindholm" <linmag7@gmail.com>
Message-Id: <ec5359c1-c16e-4177-8dfa-2ae5ab8a874f@app.fastmail.com>
In-Reply-To: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
References: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
Subject: Re: [PATCH v3 00/15] exec: Remove AT_VECTOR_SIZE_ARCH from UAPI
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026, at 10:37, Thomas Wei=C3=9Fschuh wrote:
> There is nothing userspace can do with this value. In the kernel is
> always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
> userspace and also changes from time to time.
>
> Move the symbol to kernel-internal headers.
>
> Meant to be applied through the asm-generic or execve tree.
> The default recipient list was huge. I trimmed it to only the
> architecture lists.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Hi Thomas,

I'm happy to take this through the asm-generic tree. I've already
made sure it all applies and the patches look good to me. I'd
wait a few more days for additional Ack or any other replies,
let me know once you think I should apply this version.

       Arnd
