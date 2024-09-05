Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4169E624
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 08:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725525268; cv=none; b=G+Mjb/hAAziDXu226j4kPvOCPmLJmc1jxZBDej/vOxnar7k3r3wwKGmNT2vMr8RKEdttVqsZtxNGe2iripegkPFT7qq653Jshv8cZtLGqpj5qJyZc6Bo7q0FJseYs4EWzB9pER0JLC6x/9xtVtwPezX8PgA51kyBIttsrdQZ9e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725525268; c=relaxed/simple;
	bh=VckIPtdfed8GjyudCjkRZ3LDyAZv0/6vNcZcmWw9JEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFj8HDAK9+GOP70XxzDmCxjKCpzJ+VZWL91iSaldKQHrD8ojKAwkbzeMOOga5qrmEUW7O1pAr85oS7hFvowkNi1dWIpjHh+dcMZ9Vv4KLve9KiriYoFEogoZlH1cRp0B391WemlaPFpZQqmuOy6kVD5lxdKkYy4t90Q3yV8JQ1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/B6GMnO; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/B6GMnO"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8696e9bd24so73519666b.0
        for <loongarch@lists.linux.dev>; Thu, 05 Sep 2024 01:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725525264; x=1726130064; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VckIPtdfed8GjyudCjkRZ3LDyAZv0/6vNcZcmWw9JEE=;
        b=M/B6GMnO37PAG5gapTfWZfl4H2MEydS/OjZ0of07UoaUxIrBRKb5sIvbephfHVfKrN
         gQ9slR5uFF/d8QHn974/SUtUZoBfVD6Uv7B94vVlqLZaWd2NOuMpwScH2I7JZKCcHwFA
         PJrbnt+1/h/bpjqmFMPMpkPThkboBsCNRgzEPG9kjBCCwesgfMEJkpfUgU7cnoCfWoGi
         /qk0D1hJ2dKAzi/rhlsaSo2Vkf51/jkdUVdlF600hFNPGMt2I1hS2XzbIkYtkAQRj7ED
         BUrz2+a26SfeLAEsddxie7+9ENF/fWSQw7UO9N+d/h8+HvD4wZxM4qoULpg4XYg7vey+
         cLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725525264; x=1726130064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VckIPtdfed8GjyudCjkRZ3LDyAZv0/6vNcZcmWw9JEE=;
        b=iqlCku+RrYliZt2PGmZElJA27r3G3zi6IPUJd4ll4OtGfMM5aOBG2EAuNYK8FwlMuT
         gkiNmKzLNh91xgkctm+Tj3pGr+QQj5QdgHRIdgOc5lPQsIVoQroQC9rbvY62IzFk0hR4
         K3w2A7FaZXidNHRXPtvFm2Ci/2SHPb8FbBDrqvlMCmQ0iSoNOCePKqqdIWUoovS6XnCJ
         kI/BEGjA9BWQpXDDQNWMEoCUXiJaa5KNXJUFotvIKFXHbtswJshjcq6beI0M7uPO0Ayq
         ImWoucsPJz7WzBFaYH2gkNP7f62htP1rH3SOQJoPzeHWUxEPL/3LOFrOF6fJPL7u3ZVy
         KUFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj9EiQcbHwk9UnGdabDvIayvmVIKEIv+lsxBfUZ7fSkeO2Od16ad93EyHhwIknD/gNtSzjAub2WAg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxS/0rdwzTxtGETp7v0e2KXRdST7WRnXWCqgGtPtyVVjSimlzvO
	uUhl01AIWwaXrPobYZv/U6CrQ5VlsPWOitQR3yC0bT6nfzgF6Dk/0afcmujvL18uL86XFOEQSBw
	7VjrYTiWEqZvCkkSbKrsDatSWIBU=
X-Google-Smtp-Source: AGHT+IHvV+aIbib5qEchTzia04VRhd80KuVjvWRdgg5ffoysV8XnGZaJsGq5V1QhKeXUroZD2jmRuq6BJYEVPV0WRro=
X-Received: by 2002:a17:907:7251:b0:a86:7c5d:1856 with SMTP id
 a640c23a62f3a-a897fa744a8mr2068532266b.46.1725525264155; Thu, 05 Sep 2024
 01:34:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1725518229.git.zhoubinbin@loongson.cn> <f581c749-999f-44a3-94a8-a39d355c32c5@linaro.org>
In-Reply-To: <f581c749-999f-44a3-94a8-a39d355c32c5@linaro.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 5 Sep 2024 14:34:10 +0600
Message-ID: <CAMpQs4Jqx56NRkdVPztPe+xXcY-A=WDxGua-pc1OyYG8kD2Q0Q@mail.gmail.com>
Subject: Re: [PATCH v1 00/10] ASoC: Some issues about loongson i2s
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Huacai Chen <chenhuacai@kernel.org>, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 2:14=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 05/09/2024 09:02, Binbin Zhou wrote:
> > Hi all:
> >
> > This patch set is mainly about Loongson i2s related issues.
> >
> > Please allow me to briefly explain this patch set:
> > Patch 1-2: Add ES8323 codec required on Loongson-2K2000
> > Patch 3-4: Add uda1342 codec required on Loongson-2K1000
> > Patch 5: Improve code readability
> > Patch 6: Fix the problem of unable to detect codec under FDT system.
> > Patch 7-8: Add Loongson i2s platform device support
> > Patch 9-10: Related DTS support.
>
> This was based on some old tree... or you do not use get_maintainers.pl.

Hi Krzysztof:

I used the following method to obtain the email address I need to copy:

scripts/get_maintainer.pl sound/soc/
Liam Girdwood <lgirdwood@gmail.com> (supporter:SOUND - SOC LAYER /
DYNAMIC AUDIO POWER MANAGEM...)
Mark Brown <broonie@kernel.org> (supporter:SOUND - SOC LAYER / DYNAMIC
AUDIO POWER MANAGEM...)
Jaroslav Kysela <perex@perex.cz> (maintainer:SOUND)
Takashi Iwai <tiwai@suse.com> (maintainer:SOUND)
linux-sound@vger.kernel.org (open list:SOUND - SOC LAYER / DYNAMIC
AUDIO POWER MANAGEM...)
linux-kernel@vger.kernel.org (open list)

The code repository from MAINTAINERS:

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/log/?h=3D=
for-next
base commit: 097a44db5747403b19d05a9664e8ec6adba27e3b

Is there anything I'm missing, or where I'm going wrong?

Thanks.
Binbin
>
> Best regards,
> Krzysztof
>
