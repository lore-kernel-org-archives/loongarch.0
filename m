Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F276C1CEADD;
	Fri,  3 Jan 2025 08:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735893971; cv=none; b=BP21Kv7XDfhKjaBCq5mbz768uTwo4Uh7TLEjmPdoD6xxSsFYhE9APSR0N6whyWUTZ1CCJNHVVhC/7BOVDkhz7MC64kpkhuXP/iAE+u3pE60jwah/4G4pXDVCB9BX+Z+jgVthcUyIPcks5pgUc8YhCP10MpgkknfOPBRP0Coln6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735893971; c=relaxed/simple;
	bh=kxjiSFv+0buM6DB78y33DSm3tStir+/J2fiZ5iY2N5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ruOclDBsgdox8KP1rVAC0ON0goOzjlhFx5VfmtASdDzYqZH8hFT/kO0rC5gu20CyZZ/vdgOj8BoSFsY7EbeJTjXdJk2czZgDZF2b1NdhV9zzG3GkVFt56N6XcpC4STyjTzlt526aZLR5L8Xmbc5WB2H11kAceAyiOmpnZhkE6FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=paJC6ja3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="paJC6ja3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9EBC4CECE;
	Fri,  3 Jan 2025 08:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735893970;
	bh=kxjiSFv+0buM6DB78y33DSm3tStir+/J2fiZ5iY2N5E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=paJC6ja3y4+rADRtpqOUQ2e+ihlqWfdluTJnrpqRIiH+g62Lswy23qlYllc1v/3e4
	 s8BNapCJa9JwCGq3rUL4ZFoUW9/SB5/fSjCRpNwWCWq/56gYpXQGTly7G9mwA3k7nP
	 arN/Iqu4JeQ7vRb7UTGL2K6qAGNMlk+HhqpK4UbGTVOJcUmeQ4vqJxBAqXnr/kwwiQ
	 di03tjKf6hycnCkKQIdRqXmJ1U/bAxjcAdEqDe9dB1Uw6Vhg8dZrgUWoYutbA8/l+D
	 2EpfnlzSWrZqCWLNLyrj+irJmuxRDs2SgPcpOh+LWOm5RgY/POpmqDHmIUO2ermTra
	 uolO+yYYeuJ+Q==
Message-ID: <ad947db9-119b-4931-ab13-31ea25a66db9@kernel.org>
Date: Fri, 3 Jan 2025 09:46:04 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 RESEND] soc: loongson: add Loongson Security Module
 driver
To: Zhao Qunqin <zhaoqunqin@loongson.cn>
Cc: arnd@arndb.de, olof@lixom.net, soc@kernel.org, soc@lists.linux.dev,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, xry111@xry111.site,
 christophe.jaillet@wanadoo.fr
References: <20241224072500.15669-1-zhaoqunqin@loongson.cn>
 <f9138082-1d17-4247-b365-7cb4eef88879@kernel.org>
 <22cb222a-a34d-b2ff-88cf-2e9433aed310@loongson.cn>
 <c80efae8-7f5c-4f2e-92c0-510511004ad1@kernel.org>
 <ad63f9ab-90cb-abe7-8099-2666e9a65a56@loongson.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <ad63f9ab-90cb-abe7-8099-2666e9a65a56@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/01/2025 09:35, Zhao Qunqin wrote:
> 
> 在 2025/1/3 下午3:26, Krzysztof Kozlowski 写道:
>> On 03/01/2025 03:25, Zhao Qunqin wrote:
>>> 在 2024/12/28 下午7:02, Krzysztof Kozlowski 写道:
>>>>> Only ACPI firmware is supported.
>>>>>
>>>>> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
>>>> I don't get why you are sending this to soc. This is loongson specific
>>>> and is supposed to go via Loongson maintainers.
>>>>
>>>> And why is this a resend?
>>> There are no platform-specific maintainers, So I initially sent the
>>> patch to Arnd,
>> What do you mean by "no platform-specific maintainers"? This
>> architecture and this platform is abandoned?
> 
> Sorry for my poor english. This architecture and this  platform is not 
> ababdoned.
> 
> What I mean is that there are no Loongson staff to maintain 
> drivers/soc/loongson.

But there are maintainers of the platform, are they? Someone cares about
Loongson or not?

If someone cares, then Cc this person and this person is responsible for
handling your patches. This is called "maintainer".

If no one cares, then platform is abandoned and we should consider
calling it orphaned in Linux.

> 
> The current maintainer  for drivers/soc/loongson is Arnd.

I don't think so. First, it is unusual. Second, maintainers disagree
with you on above statement.

You keep disagreeing here with me and I am afraid we will end up in
endless discussion, so to reiterate because maybe I wrote my emails too
soft or too conditional, instead of stating the desired outcome:
Please send your Loongson SoC drivers to Loongson maintainers and they
are supposed to take it. If they do not take it, I will send patch for
making the platform orphaned.

Best regards,
Krzysztof
