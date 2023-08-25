Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593A310787
	for <loongarch@lists.linux.dev>; Fri, 25 Aug 2023 15:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8FD9C433C7
	for <loongarch@lists.linux.dev>; Fri, 25 Aug 2023 15:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692976794;
	bh=4IIMN3b2kTYVIvu/5e5trpnBMJWv+uT58S9QzRv0bAU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=R7c1cryVSOxME9/BeSMQ9zIFCAkOeTfE+s2H3EgFxg3B594m0xJLnN5VlR9p+Phm8
	 3sPCHGZ4vMc9nniIpjfhFg6Q1mW4lRBhofErsCEW/TYgtA6H8/r8PKcl5QEsIbvs9+
	 Xjod8eQKyBCa4fqaLE4yQo2sPP7WPCnYgN1UdqLrKNIFSJsLHK3TbKUY+5PiyEwGi9
	 d2xRZeRBAAlT7YSOClf/aZFgVDyvwNcVwaXIGZ4wrJUUffjP3l22fXQjniQB5okogQ
	 0k93wHMH6qGeUYO7GuHqCUbubkqtPuK/y/cuWQ9Y7rGzDlcw4LgkSKNHh6n4xiOzvb
	 9SoXzgAP3MpNw==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-99c0290f0a8so134745466b.1
        for <loongarch@lists.linux.dev>; Fri, 25 Aug 2023 08:19:54 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw+pu4fdnJGW8InayXDEBabIUbLMHLX3MRpXT1tKXZk25QnUGMv
	Uj4Kdpb0KJ5EXYpA4N6AN5qA/b52jaa8bayOmzA=
X-Google-Smtp-Source: AGHT+IEMI0O5voiMBdZeSfNdo1xEa2uTWFdFqG6MIazk/Jy3gtA8gmZPT/r4C5DSsfX0sUeycQbjleULnsMw16rUPOg=
X-Received: by 2002:a17:906:5198:b0:9a1:b967:aca8 with SMTP id
 y24-20020a170906519800b009a1b967aca8mr8301421ejk.4.1692976793122; Fri, 25 Aug
 2023 08:19:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1692783907.git.zhoubinbin@loongson.cn> <CAAhV-H7hi=yc=PfDBafXVS5CSwEeE2WmbAAhnnDm6iYFF3YzkQ@mail.gmail.com>
 <20230825-doubling-waltz-6444e26152db@wendy> <CAAhV-H7FAKa2_+rfyboVYxvQA0sJmaWnKj3yCJZkqe_FEx9J2Q@mail.gmail.com>
 <20230825-exorcist-periscope-045ad906d919@spud>
In-Reply-To: <20230825-exorcist-periscope-045ad906d919@spud>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 25 Aug 2023 23:19:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7LMYn2u8f1waTpWn8pS1jJC1BNVWzq5zw8vE+uecx+aQ@mail.gmail.com>
Message-ID: <CAAhV-H7LMYn2u8f1waTpWn8pS1jJC1BNVWzq5zw8vE+uecx+aQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] LoongArch: Add built-in dtb support
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, loongson-kernel@lists.loongnix.cn, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Hongliang Wang <wanghongliang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Conor,

On Fri, Aug 25, 2023 at 11:08=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Fri, Aug 25, 2023 at 11:06:40PM +0800, Huacai Chen wrote:
> > Hi, Conor,
> >
> > On Fri, Aug 25, 2023 at 7:59=E2=80=AFPM Conor Dooley <conor.dooley@micr=
ochip.com> wrote:
> > >
> > > On Fri, Aug 25, 2023 at 07:38:31PM +0800, Huacai Chen wrote:
> > > > This series looks good enough to me now, if no one has objections, =
I
> > > > will queue it to loongarch-next.
> > >
> > > Have you not read Rob's replies?
> > I'm sorry, I have read but I thought Binbin's reply has answered Rob's =
question.
>
> As far as I can tell, it didn't - but there were was a reply from Rob
> about dtbs_check issues too IIRC.
OK, I see. The dtbs_check warning is being fixed in [1], but it seems
that Binbin hasn't got the key point of Krzysztof.

https://lore.kernel.org/linux-mips/d11873a1-b552-71f5-1100-7464687f8bb4@lin=
aro.org/T/#t

Huacai
