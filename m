Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC3A374ED
	for <loongarch@lists.linux.dev>; Tue,  9 Jan 2024 12:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WrnmuyEu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDD0C43390
	for <loongarch@lists.linux.dev>; Tue,  9 Jan 2024 12:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704802418;
	bh=JewRYi4gil1QvUWOfVsziba+6Np9gqvhby+iPd9U/3M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WrnmuyEurynw0KzfIj18zQXC17VR+wF1xF7baEbALzbgEuOFuWZvtNzNuqnwqMS0d
	 a2kr2x8raJz/N1IiEtcvcRkQEt65irtYM9LMs8OgtbUGZlQ81ZbfqNfJuWxZZOwRcg
	 ieUgr1cOriqe7BrKfI716SS7UeiSXth5IhgndpKnEqMMGuYGGr6JznJ/3IZHOoV+qz
	 kmX3GEkiFbuhdlqp3i7CJM6ppMVCzDzILZCxuq5frKcWCyyEhYrO/iU9T+e2nnEt6X
	 s0GTbcenKHb4Suao+X+bDnQmXs+sFrC7FPcSVSRvNE80WjPEg+h0oqGTVUgfvui7Cn
	 OZnhhzk2ZviIg==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-557bfc7f7b4so2876855a12.0
        for <loongarch@lists.linux.dev>; Tue, 09 Jan 2024 04:13:38 -0800 (PST)
X-Gm-Message-State: AOJu0YxjaAeTCnZZDchZnHv5a89gYbImukzLNBJzpnPCyIuZDE0ufZKo
	p9y954wecIHx/UEPZNuEDIDoTse+4mfyBcy8mYg=
X-Google-Smtp-Source: AGHT+IHh0VyV0O9Fsi1IwtZL5ikW7aANvsoD+E5uetFQvhJfn7Fy/dn7Vo91jDGhx4itveKj9QhuBeBlBUlwqZBCRJs=
X-Received: by 2002:a17:907:7ea9:b0:a29:d805:20ec with SMTP id
 qb41-20020a1709077ea900b00a29d80520ecmr725121ejc.22.1704802417360; Tue, 09
 Jan 2024 04:13:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1703229766.git.zhoubinbin@loongson.cn> <20231222-support-relieve-5d8f25292b40@spud>
 <CAMpQs4+Uwu=j56Qa_V211_hC+F4MKE6mvTVtW75M1wuAY3-p1g@mail.gmail.com>
 <20231228-ultimatum-paramedic-6c0301f56d1c@spud> <CAAhV-H6O_Ke-xJPGFmgdwNVbGkDS2P6EK3ecfgo9KkkNyi9eOg@mail.gmail.com>
 <CAAhV-H5aZc2sWhodA0+V9aWBUoD0oD4tQHiqDSyg2B-iuHDA9g@mail.gmail.com> <a51aec3f-3f1b-4e8a-bfaa-904ef2a79c64@linaro.org>
In-Reply-To: <a51aec3f-3f1b-4e8a-bfaa-904ef2a79c64@linaro.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 9 Jan 2024 20:13:24 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7QQD9ida52rvkhUgzU6O1KmKD7EsNxn=7YyVZP4HXa=Q@mail.gmail.com>
Message-ID: <CAAhV-H7QQD9ida52rvkhUgzU6O1KmKD7EsNxn=7YyVZP4HXa=Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] LoongArch: Add built-in dtb support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor@kernel.org>, Binbin Zhou <zhoubb.aaron@gmail.com>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Hongliang Wang <wanghongliang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,  Krzysztof,

On Tue, Jan 9, 2024 at 7:14=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 09/01/2024 10:57, Huacai Chen wrote:
> > Applied to loongarch-next, thanks.
> >
>
> It's merge window, why do you apply patches? For which cycle?
I'm sorry I forgot to reply to the email when I applied patches, the
patches have already been pulled in linux-next some days before.

Huacai

>
> Best regards,
> Krzysztof
>
