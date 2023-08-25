Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED51CA55
	for <loongarch@lists.linux.dev>; Fri, 25 Aug 2023 15:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED45C433CB
	for <loongarch@lists.linux.dev>; Fri, 25 Aug 2023 15:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692976013;
	bh=aoa9SpiddCCbsGDK0qCGqgLiVHR3F5V6H8tD8MlERUU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Dh9Rjb2jQ6r9j059Uwhxiyvezp14nS8dBy/H5yWlREyTNN7KQ+ntfosIe5OiCykJq
	 eISMldF+hL7YP/25r26WrxX/OD9ORpm1cSzSKohd7EsCG6V7DFT6rw22PTleuknIuQ
	 Jw1EH0opFqFMQoUiOn1z7ZMlC7dqDiMdBCq+t93lbVIIH1TAPz3KlzfSLZvsVOXwAY
	 LdxJpNGIdgKAhlIjH/cj8zmv/heKhwNSLCVDXugvzxtnQJf31WiFMgYTSTtuTRc+3r
	 iS3RgA1EGH4WB8IFyFzEtw7NntAD9yww9GK7Pp6sPZ0kWRhwjAf6P7k8rIWjdIupdA
	 vf2DGmTBu0RLA==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so4298428a12.1
        for <loongarch@lists.linux.dev>; Fri, 25 Aug 2023 08:06:53 -0700 (PDT)
X-Gm-Message-State: AOJu0YzODm94U4Uru445aGbVcJBW8K7oXYWP799JAKW2B8aSQnppy1dc
	9ixY4ZotWzVFV+ipNnXafxsdLR4fsauF9MRVWwo=
X-Google-Smtp-Source: AGHT+IHc5JSxCXE8m98hIvK2tbHhtu57wqYax7SbzVv3ZP3N3JD/do5wUMs7KyetdwRfQfANAMcuKXAB2a8CJkOY5vc=
X-Received: by 2002:a17:907:a410:b0:99b:af5a:fc2c with SMTP id
 sg16-20020a170907a41000b0099baf5afc2cmr20847771ejc.26.1692976012078; Fri, 25
 Aug 2023 08:06:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1692783907.git.zhoubinbin@loongson.cn> <CAAhV-H7hi=yc=PfDBafXVS5CSwEeE2WmbAAhnnDm6iYFF3YzkQ@mail.gmail.com>
 <20230825-doubling-waltz-6444e26152db@wendy>
In-Reply-To: <20230825-doubling-waltz-6444e26152db@wendy>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 25 Aug 2023 23:06:40 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7FAKa2_+rfyboVYxvQA0sJmaWnKj3yCJZkqe_FEx9J2Q@mail.gmail.com>
Message-ID: <CAAhV-H7FAKa2_+rfyboVYxvQA0sJmaWnKj3yCJZkqe_FEx9J2Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] LoongArch: Add built-in dtb support
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou <zhoubb.aaron@gmail.com>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, loongson-kernel@lists.loongnix.cn, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Hongliang Wang <wanghongliang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Conor,

On Fri, Aug 25, 2023 at 7:59=E2=80=AFPM Conor Dooley <conor.dooley@microchi=
p.com> wrote:
>
> On Fri, Aug 25, 2023 at 07:38:31PM +0800, Huacai Chen wrote:
> > This series looks good enough to me now, if no one has objections, I
> > will queue it to loongarch-next.
>
> Have you not read Rob's replies?
I'm sorry, I have read but I thought Binbin's reply has answered Rob's ques=
tion.

Huacai
