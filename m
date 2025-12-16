Received: from mail5.out.flockmail.com (mail5.out.flockmail.com [54.161.96.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD0A314B8E
	for <loongarch@lists.linux.dev>; Tue, 16 Dec 2025 09:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.161.96.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765878282; cv=none; b=TW1U4yxBimONlGXFKLjCbOVpKMgA1mHxS0sP4Gls8rVOfoqR4t735TinwNxf9qBhePrApSUxHrYRub2zKgFv5uxU7v04GVoePWnDmj19ZdOL+QMAzkB/5Jrc2+ZrL0NwESnb4hnvK2g9WVQKsyOftEgCuCXe34P1yAurZ0MzeBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765878282; c=relaxed/simple;
	bh=PUFAyyeMb5AhKlkBKg1drn56hj0vT5LMt3ZkgWpcO2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkaYT0fmFzo4dqmqo/UajDz8K0+EWuS1VRMjcY3tyyluAH+QDkaOT0KHjQccQuwA8LKBQarICMK9pK1kte6iKXODUiwsysdP31IEQlfwkpl6jjaRP+7WCr2To2E4cfpUl1jvQh91+Viorj7f8Q8KDUGZz/FUWEiAsp0BgBb+Vl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.b=Fs2cDlqq; arc=none smtp.client-ip=54.161.96.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.b="Fs2cDlqq"
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4dVsTY4YCtz9rxf;
	Tue, 16 Dec 2025 09:44:33 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=1CseB0MqoJFvzm74cS5sjzhEHKvHJ6oW75xDVjFAP74=;
	c=relaxed/relaxed; d=ziyao.cc;
	h=from:message-id:references:to:cc:mime-version:in-reply-to:date:subject:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1765878273; v=1;
	b=Fs2cDlqqtQ92UMaZaq6QFCjOXdq9f098pKSoy74GgNMuyy0jvL8Dwh8djvRYJ/5VoR29LG/m
	CFvPfwXN/rO/yGNJ7nhFnEEQSx6jpalpXQeIMBGdJ+zTb5DaMDb2vGxNIIZuW8InnMpNbr6WNuS
	VtFE9n7NPS4wj+9nYZYhQT/8=
Received: from pie (unknown [117.171.66.90])
	by smtp-out.flockmail.com (Postfix) with ESMTPA id 4dVsTV0TfVz9rwn;
	Tue, 16 Dec 2025 09:44:29 +0000 (UTC)
Date: Tue, 16 Dec 2025 09:44:26 +0000
Feedback-ID: :me@ziyao.cc:ziyao.cc:flockmailId
From: Yao Zi <me@ziyao.cc>
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 7/7] LoongArch: dts: loongson-2k1000: Fix i2c-gpio node
 names
Message-ID: <aUEp-pEwHk0Ls6CD@pie>
References: <cover.1765778124.git.zhoubinbin@loongson.cn>
 <9684ae4e58fd1e9768cccf6e3ae730eff46fb29c.1765778124.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9684ae4e58fd1e9768cccf6e3ae730eff46fb29c.1765778124.git.zhoubinbin@loongson.cn>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1765878273474105894.21635.4198284917602837240@prod-use1-smtp-out1003.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=a8/K9VSF c=1 sm=1 tr=0 ts=69412a01
	a=rBp+3XZz9uO5KTvnfbZ58A==:117 a=rBp+3XZz9uO5KTvnfbZ58A==:17
	a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10 a=CEWIc4RMnpUA:10 a=pGLkceISAAAA:8
	a=nWqmHdOqKvjv4xVzHEUA:9 a=CjuIK1q_8ugA:10 a=0Om0YbJOx1jdy8GrVaHL:22
	a=3z85VNIBY5UIEeAh_hcH:22 a=NWVoK91CQySWRX1oVYDe:22

On Tue, Dec 16, 2025 at 03:56:59PM +0800, Binbin Zhou wrote:
> From: Binbin Zhou <zhoubb.aaron@gmail.com>
> 
> The binding wants the node to be named "i2c-number", alternatively
> "i2c@address", but those are named "i2c-gpio-number" instead.
> 
> Rename those to i2c-0, i2c-1 to adhere to the binding and suppress
> dtbs_check warnings.

I think this is an unintended breakage in dtschema upstream, but not
really a violation. As I've mentioned in my original cover-letter,

> which IMHO is a regression caused by dt-schema commit 57138f5b8c92
> ("schemas: i2c: Avoid extra characters in i2c nodename pattern"). Commit
> 647181a1f8ff ("schemas: i2c: Allow for 'i2c-.*' node names") fails to
> fix the case, as it doesn't take nodenames with multiple hyphens in
> account. I'll start a separate series for this.

So I think it should probably be fixed in dt-schema instead. i2c-gpio-X
provides more information to me, and I don't think it causes any
inconsistency or ambiguity.

By the way, we also have dozens of arm dtb targets shipping nodes named
like i2c-gpio-*, mostly microchip and st ones, fixing the regex in
dtschema upstream will also eliminate warnings for them.

Best regards,
Yao Zi

> Signed-off-by: Binbin Zhou <zhoubb.aaron@gmail.com>
> ---
>  arch/loongarch/boot/dts/loongson-2k1000.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/loongarch/boot/dts/loongson-2k1000.dtsi b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
> index fa1c000fd3e0..f70b245c8bc4 100644
> --- a/arch/loongarch/boot/dts/loongson-2k1000.dtsi
> +++ b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
> @@ -46,7 +46,7 @@ cpuintc: interrupt-controller {
>  	};
>  
>  	/* i2c of the dvi eeprom edid */
> -	i2c-gpio-0 {
> +	i2c-0 {
>  		compatible = "i2c-gpio";
>  		scl-gpios = <&gpio0 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>  		sda-gpios = <&gpio0 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> @@ -57,7 +57,7 @@ i2c-gpio-0 {
>  	};
>  
>  	/* i2c of the eeprom edid */
> -	i2c-gpio-1 {
> +	i2c-1 {
>  		compatible = "i2c-gpio";
>  		scl-gpios = <&gpio0 33 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>  		sda-gpios = <&gpio0 32 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> -- 
> 2.47.3
> 
