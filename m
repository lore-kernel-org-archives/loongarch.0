Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E98D20B812
	for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 07:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754898145; cv=none; b=XsixH+shzJHIkb5qeIaWGRlVfmloGExsxE+AtzmuhF66sZDLy+5QNcxFiqyP6/ekxrs0By7AhE9B47LZh+zrQ/BraKXZXTuzjgOJV08WalweS35fui3Tn02IEsbsPXAkdgIjKoAtlSibG+jueNQ9aWJ+b4kiruAcpXKSHqaLTjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754898145; c=relaxed/simple;
	bh=t8BVFXTwveELKbs4OwD70dbHLgAP1n/Ksj561GHwMkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dxM9l0QoBeGDzuA/1d3Gf50DXYgDir6J8gtjZjC2aACXmc/4ATy4GGXSeK71q2vVva8y6m96Kc7XXdis4gVK+j5WkhcGuwtnE9UMgqpPSthgLZjt+7Ggg+YTKM0tqmh29rVIm9PSr2SLeoKIvdg8vspsyy+gFG+NBIDTw2hgJgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=he2tfvv9; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="he2tfvv9"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-61568fbed16so6319531a12.3
        for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 00:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754898142; x=1755502942; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8BVFXTwveELKbs4OwD70dbHLgAP1n/Ksj561GHwMkQ=;
        b=he2tfvv98W00XoU2N1hXKL3M34vaKnI+LCD+V6Yhh6mvPbmOsj18QbmJd7QD+o81BE
         KC6EQSE7Wn5c9aGWdfciOfN81Jvkl5/9wmqHBtvawmFlORb2GOh0xpN/TLa/pd06St/p
         4cWn5nOcil5Jv6rh1q/UNiVqIvJCI12ULaBpoaSX7uRIVePyrBGRpxakJdU02RXpdqVq
         dvQ9zPIwDZyWgrWWXk94xEP2wCcS8BSVfZ5/dECDzfCVWvUUvMnNoBwnSppJrl7an0ct
         /x35RbkD70WujxPhf20c6P8H/tOIMgeyT8JAcSezOmiH3HLZmBhBpbcV3q+hygWM+WOd
         qdwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754898142; x=1755502942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t8BVFXTwveELKbs4OwD70dbHLgAP1n/Ksj561GHwMkQ=;
        b=hPERtro9JrCYn+sxCiJ6MKpQyoKs4ejs2H8gmwWIkNjEncrYRm5Ir3Dkx9uoNvjFgn
         sMdAEEs0RhUNTweT6tVXn9ggMeP+vmQLClbOMvEiyJDJA9r5VboVLQ7BPSDhkI79HUzZ
         MOWti6VMQ3OmOtZNZDxW8ghBwwb98peuIa+A6ZTmioPcrWeS/1WLFh7OGx+GPvQsoQEn
         HYGxnQvvHmJIIvFZBVqY6c427f/53KLmlA4yKLf2/Yw1hbvAsKxH/E5mMjiLM/YktS8c
         opjyUAAqm70CGU/Hinvp9xcwr9VS3vvli7ZHolgPf7gwF+83ZrXSKpYokbhiKZ6Uw8Kb
         rBhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCWa7SNhvFQjo45GbKqpWcevionWUwlACD4I1gQLyS8TRw4A7eFqzv7WJ9CI/gIohBun+UR+f+noQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyAoR7y0boJv0Sg3vbgYtaXyFrOx+Ku4KooL4E8cDdmQ/StkiR1
	t7A8AcLEv1uo6GJOuvLn4YRviH3+SPVW6IZBmSYtAb9dZ8meSnNEPak/m1mMka5x57ButdQbPtI
	1/FeoGISOU/lbrJZ5tcmLacGgjYHETFM=
X-Gm-Gg: ASbGnctJmvtCEVRVF6zMXsEqXv5Wg5bFZIxvv+cPcw+0s7qei7FtReRVE7nU8CwKKq4
	XnzuVvULQJvS+9l7puU9drBT47FjR0dj40U8c8nEPusifn+B6M0NLV32hun7XXERQ1P7zT1fPnh
	KNNpm5vwXwC1Boc+LE5OnDbfEgSiOStPjp5a9hsK2zLzDjlxj/1YXbJpYC/BgNK08E67Kg9swX+
	3zDQrnZgklVNiMBnA4=
X-Google-Smtp-Source: AGHT+IEkjOj3UKdq5Lw70VWjYIWx4DN1XxZJ/fxcyup/4G5G3izgAHkxlV/d6oXutNrOUGpyT9L56you5OmTyGhnpps=
X-Received: by 2002:a17:907:6d26:b0:ae3:60fb:1b3b with SMTP id
 a640c23a62f3a-af9c654451dmr1188592466b.58.1754898142186; Mon, 11 Aug 2025
 00:42:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1754890670.git.zhoubinbin@loongson.cn> <a6b216e6726edc00a910ba543ef8f7a9195b94f7.1754890670.git.zhoubinbin@loongson.cn>
 <208c1e34-85b4-47d7-a4d3-8b8b7f2caa84@kernel.org>
In-Reply-To: <208c1e34-85b4-47d7-a4d3-8b8b7f2caa84@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 11 Aug 2025 15:42:09 +0800
X-Gm-Features: Ac12FXykFn-VkPb4s7ncj5ZNyjP62ENy5djpOE4M8jd15rPFnSJRHeLczU_S9rk
Message-ID: <CAMpQs4+OcC_jMvQVc+u9ue9HeBEPcbzWORC0rWkXhj3y90fvSQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] dt-bindings: mtd: loongson,ls1b-nand-controller:
 Document the Loongson-2K0500 NAND controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mtd@lists.infradead.org, "Rob Herring (Arm)" <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof:

On Mon, Aug 11, 2025 at 3:32=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/08/2025 08:03, Binbin Zhou wrote:
> > Add new compatible for the Loongson-2K NAND controller used for
> > Loongson-2K0500 SoC.
> >
> > Acked-by: "Rob Herring (Arm)" <robh@kernel.org>
>
>
> Why do you add quotes?

Emm...
Sorry, I didn't notice that.
I reacquired the V1 patchset using =E2=80=9Cb4 am xxx=E2=80=9D to avoid man=
ually
adding tags. I believe it may be caused by the `b4` command.

>
> Best regards,
> Krzysztof

--
Thanks.
Binbin
