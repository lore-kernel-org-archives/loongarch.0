Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234F5C8D1
	for <loongarch@lists.linux.dev>; Sat,  7 Sep 2024 07:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725695653; cv=none; b=lQeqMSj72kgToB3m6EjascN0uATir/Jo+EDY2gKm+j71qYBP6qPG76Zj1iMiFvpO6O9C9GAPYpjMWI0gRvrA2b8D4ifDa0FPNr9JJcBG79YtlG0hmyHJH1ohs3huqjVa8wOIL2tl5dH6RwBSuMy/UQD4CK6PdXsg113kOCazpAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725695653; c=relaxed/simple;
	bh=Yz/TSvkOcbi8EawEHGU5BgH6byiZVXkVjz9PR4nfGd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ThzI3lsmIAMY8wUF8xV/9Qr88eRizXuJQlwuGnXZnLwInPOsI7EabnABcoPXcIkc/zrQjvOU/AlkSJSokgdioYoI2X8HVBFQMvhJKDubziqMwuHzMOnb6FgIwVmRVQUMTtma5snpo8bR5N9E6zCiSEFSDtLqwgG0tAUuWgMt0Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+x/IhnA; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+x/IhnA"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8a7929fd64so310797166b.0
        for <loongarch@lists.linux.dev>; Sat, 07 Sep 2024 00:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725695650; x=1726300450; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZInpS0DO8RREpWDAkRwr80k3sSMpCCobGvcP4yMoWqM=;
        b=Z+x/IhnA9NSkvITRWRUkPhA7KHd3xNO6MLp7bqWRS4v9iql/5Xy98xx6LpOKnYc7EF
         a+IMeSMl5BnkFtPfruHbTpEexyODA++I3jm3wQanQZp+iJ61Y/4CWBlRDtbs1PKhL8H6
         9oKIkUZ17dbT3uAt8pc3kjHLbB6I1dnRtmE38apmnXsOiv98Hoyo63dv8jb6WuMX+PmX
         X6armqI4Cvb9LObHRutimYEBzszrd1ekfYvQQaZJhdjpk7fulHK+a4aBBV+hXYYtkdVa
         Y88eQWm5aiD4Oreq6vAKuOoQWRrYy6D/dXdHCINt3HKS/FiVJFPaSEJviWg7ZieLHxAL
         n8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725695650; x=1726300450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZInpS0DO8RREpWDAkRwr80k3sSMpCCobGvcP4yMoWqM=;
        b=fUwUEGIoYgK613OVeAv1HLdVou9ztClPnqOobjuj9sVn8DAjUKqRhkoB6XV+Pm822B
         KqH701ALZNxON4zowRqWMNT4heodAJrArqzEj++PS4s9F51eNVcfk8au1ynzEGAzfpMN
         GRvS/qFCd9oXrc9kIathJ5aijzOJNN30fWQXnMMUXwPJC57iglZ3YWFcLn0FHdPezJRT
         I+g0zV+K9W3IdIj1ASM6bxxTU9FBkMkIasPVrIz9AlwAfPXwVv6dBJP/dstLM6Nil/MP
         pSfhWnM5bfxIUXQEvJBiMAAlJxjk4JLq06zvIR0THBcZQI/N/s7VOBcjpPwVbm4Wt5Jq
         1X2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVi71undVJTR/7a3ElBYSFMYFfaHksrbexiqfkyz7W/jX8uBV/2p2jP9TzAgWIQvh4PECOsidHkWhg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKZXVsh0nsjPt4OfVeeRbOxbNoVm+3EVIOdPlUVne5XehbK3eD
	mEptRxWoLpfIAaqrcH4cDv6mPgw3qHSrCKRN7kGoLICdMTxZpu1VEYUSPYsqHlKTSIYBw5JErsS
	/YwAyc3qeRauCvQXLWwvUOXatoUk=
X-Google-Smtp-Source: AGHT+IG8U2O0JlaeV3XL2hA3rYuCDHO/bv3RxpxnTOEEhuHSVTdsjEjXgklDwsovrSe8NIrNzLCVEZ/RPqQAGSwq5bs=
X-Received: by 2002:a17:907:971d:b0:a8a:715d:8739 with SMTP id
 a640c23a62f3a-a8a88856097mr336580066b.53.1725695650108; Sat, 07 Sep 2024
 00:54:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1725518229.git.zhoubinbin@loongson.cn> <c54fbc2582702689c005e1ba528ab2318b1adde6.1725518229.git.zhoubinbin@loongson.cn>
 <659f9214-1287-4e20-a25f-51ab3b4c8d6f@sirena.org.uk>
In-Reply-To: <659f9214-1287-4e20-a25f-51ab3b4c8d6f@sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sat, 7 Sep 2024 13:53:56 +0600
Message-ID: <CAMpQs4KdyzJwf3qJb77rMw8RR5gUgWf5zUhnTKmjWJaGUzAVGw@mail.gmail.com>
Subject: Re: [PATCH v1 05/10] ASoC: loongson: Improve code readability
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 8:31=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Thu, Sep 05, 2024 at 03:02:54PM +0800, Binbin Zhou wrote:
> > This patch attempts to clean up driver code formatting issues.
> > Mainly as follows:
> > 1. Use the BIT macro;
> > 2. Use dev_err_probe() in every error path in probe in loongson_card
> >    driver;
> > 3. Introduce loongson_card_acpi_find_device() to streamlined code.
>
> Please split these out into three separate patches to make them easier
> to review.  I see there's also some other code reordering and
> reformatting in there which should also be split out separately.  I
> think the changes are probably good overall but there's too much
> different stuff going on in one patch to check properly.

Hi Mark:

Thanks for your reply.

That was my fault, indeed this patch is too cluttered. I will try to
split them up and make them as a separate patch series.

Thanks.
Binbin
