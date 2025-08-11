Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF0A72624;
	Mon, 11 Aug 2025 08:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754900003; cv=none; b=GWg+bhyYebeuUadfwRhtpcM4Na5M+Dz6Ycz7LCwI6LnczsE11P2sLwoxo91LbGhzL2NwC8eU+9oNeDVB1R4BW/TXtoroTY1j3YmK6fl92up6pxGXCWeo6eEj9OWNaxmJJHANIimcQZVXedURf36jnUkvAXVadYBJwp4XpRNm9Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754900003; c=relaxed/simple;
	bh=5sjPiBzdpJnO+FR0G57D0bldCe0wsDvVzVNiX8GVo3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jRfIZSHBdZi1tnK/nMQeSN1xZsNQJHybom9RGQ7Zdk+4iNxcsTAMMLswd4/1Aq4tEUv8cnO58iRp+Ju7Fd7qvwyi8gQv1d1wJsjPRRsLoVzesxZLHnoMLOJlIHTZQ04LTAo/3UqgtFDJgSRpXZRaUISiC/NjuPoREyQft7VIZEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qP9CMZeD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qP9CMZeD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A450C4CEF7;
	Mon, 11 Aug 2025 08:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754900002;
	bh=5sjPiBzdpJnO+FR0G57D0bldCe0wsDvVzVNiX8GVo3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qP9CMZeDHEIMUyDRW81lz9yYFrXw+jtqQ4lmG4odliDcLaBN7Zb3z8FBq0SBqjJRD
	 jIwIHc0Z8fx0NlTtIU+Bioq3GyTpDjjeC0f0m/9fVj9hSfdVaHrpdAdmnk9o+qF8wt
	 znSC5pXA7nFfXG+0l/VycbdArzc2403pOdGirxDD2fbSDjmZDJFPmZWJNlK+loqTpK
	 wcgSmyT59uhRn395apbWLSboB8RPzajxb/HS89c84zYjV/Wcsd/A39ROv/6KZoFtuK
	 ROEHMpKX2CvgDqd69BBrSHFev/Thp9kaXaTLEZXIRfHyv07umoEK/Qd7owiXIylbWP
	 KAhNLP0tY76CQ==
Date: Mon, 11 Aug 2025 10:13:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: Re: [PATCH v2 5/8] dt-bindings: mtd: loongson,ls1b-nand-controller:
 Document the Loongson-2K0500 NAND controller
Message-ID: <20250811-impetuous-civet-of-wind-febe58@kuoka>
References: <cover.1754890670.git.zhoubinbin@loongson.cn>
 <a6b216e6726edc00a910ba543ef8f7a9195b94f7.1754890670.git.zhoubinbin@loongson.cn>
 <208c1e34-85b4-47d7-a4d3-8b8b7f2caa84@kernel.org>
 <CAMpQs4+OcC_jMvQVc+u9ue9HeBEPcbzWORC0rWkXhj3y90fvSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMpQs4+OcC_jMvQVc+u9ue9HeBEPcbzWORC0rWkXhj3y90fvSQ@mail.gmail.com>

On Mon, Aug 11, 2025 at 03:42:09PM +0800, Binbin Zhou wrote:
> Hi Krzysztof:
>=20
> On Mon, Aug 11, 2025 at 3:32=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > On 11/08/2025 08:03, Binbin Zhou wrote:
> > > Add new compatible for the Loongson-2K NAND controller used for
> > > Loongson-2K0500 SoC.
> > >
> > > Acked-by: "Rob Herring (Arm)" <robh@kernel.org>
> >
> >
> > Why do you add quotes?
>=20
> Emm...
> Sorry, I didn't notice that.
> I reacquired the V1 patchset using =E2=80=9Cb4 am xxx=E2=80=9D to avoid m=
anually
> adding tags. I believe it may be caused by the `b4` command.

Then aren't you using some old b4?

I just did it and look:

  [PATCH v1 5/8] dt-bindings: mtd: loongson,ls1b-nand-controller: Document =
the Loongson-2K0500 NAND controller
    + Acked-by: Rob Herring (Arm) <robh@kernel.org> (=E2=9C=93 DKIM/kernel.=
org)
    + Link: https://lore.kernel.org/r/588639de591ada408bdaeb0d279c5d62a4b53=
d61.1753166096.git.zhoubinbin@loongson.cn
    + Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


No quotes in commit msg either.

Best regards,
Krzysztof

