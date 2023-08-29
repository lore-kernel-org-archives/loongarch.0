Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78279A28
	for <loongarch@lists.linux.dev>; Tue, 29 Aug 2023 06:53:01 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-58d70c441d5so49591657b3.2
        for <loongarch@lists.linux.dev>; Mon, 28 Aug 2023 23:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693291980; x=1693896780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wbrn6rF3Qk6bhR0daYra8jx/WW+Dfz3qBWgSWYBtnHM=;
        b=WBlgdPU4JsyTIsF03C2RMB8bWapO19jdjgucNzCv4X928A3t3nEgjCzIrrwmpARH1U
         xOtm1zVNF4KvtHot1sg1G34Ftnr06sbpVVYrOxgUP0pwuFrnjrkp6v4F4tW/HAuMv34t
         3XWItp0iKdvrlCzNxQGxrw4UPkzoPunliyBu6pWmbD1cUdXO2RLH1p3RyMHzWSJEuxTc
         JzLtjlLD7BmTf9ehj263PXsqcbP2OT23axLeQHiEkiBM1ZwQIqmRG69YWUNZ6NaLWN5Q
         FmAkMf0w/V4J/+RAO7P07coKO/ehaWe41eI9aph4f2RHNu5ILkDIz4NLh19ONnjsfcV0
         UqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693291980; x=1693896780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wbrn6rF3Qk6bhR0daYra8jx/WW+Dfz3qBWgSWYBtnHM=;
        b=Y32UQRh4vKlGfYZrhBDzOAzTzAnSyRfyy0KUp4ZG40hK8fhvxHv52Uj20hZt5CszgE
         366U9tyV7ezvgQ9ClHokcmr14+md5CYfJqRnL7x5ffGckx6fsspPZAETVFzuXDRd729Q
         Rcz7c2wdyD2HD3nizDkWrffLH3TMY9kdkFivJF0bS6JSF6I5z/y/WWbRexA/BDUxxULy
         EZghfXbrMYGhE4DFSQAZt23XY1ysWMZ1Ngu/hDeGieDiABNbYQsfvIEsRrEYD47QRIWP
         0jrZB6koeHrIv0zJF7Bjg0zpTVXjz5NlJexOtNBktQRyblHx8yjHNISFcoB4QyESv495
         JlSA==
X-Gm-Message-State: AOJu0YwQ3AcENdZKHTT/hUaA4YohtO/bR55shA0GYrZ88u73Hu68XsMD
	xDBQ/BALfE/7Bh1WDMPUn+hOZtsJUpWqaS9hu5M=
X-Google-Smtp-Source: AGHT+IFQywg2zIzfggbe7T2SHlvQ0PKGH/qK8XuqzOtGpZpsXdmmVbXzQUIHv4Bz+Z7Xqg+4Y/F9oP/v3+LhZFt5bRs=
X-Received: by 2002:a05:690c:3384:b0:592:8b9d:e826 with SMTP id
 fl4-20020a05690c338400b005928b9de826mr15879875ywb.35.1693291980257; Mon, 28
 Aug 2023 23:53:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1693218539.git.zhoubinbin@loongson.cn> <54ee114c08f35ab8b5dc584fd76135ac9076f5a7.1693218539.git.zhoubinbin@loongson.cn>
 <20230828-shrewdly-payee-c5eb091a0417@spud> <CAMpQs4Jp0rb8sbrLrPnNziLph4Ym4LxBsFt-00G69ecd8bUHNg@mail.gmail.com>
 <3fd27e64-2221-ec38-1320-9ae966f998aa@linaro.org>
In-Reply-To: <3fd27e64-2221-ec38-1320-9ae966f998aa@linaro.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 29 Aug 2023 14:52:48 +0800
Message-ID: <CAMpQs4+W1q0XziBVXr12xpFW=u2EkZx-_b-Mppx7cZukZLOBCQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: soc: loongson,ls2k-pmc: Add missing
 compatible for Loongson-2K2000
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor@kernel.org>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29, 2023 at 2:29=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 29/08/2023 05:21, Binbin Zhou wrote:
> > HI Conor:
> >
> > Thanks for your reply.
> >
> > On Mon, Aug 28, 2023 at 11:49=E2=80=AFPM Conor Dooley <conor@kernel.org=
> wrote:
> >>
> >> On Mon, Aug 28, 2023 at 08:38:32PM +0800, Binbin Zhou wrote:
> >>> Document the Power Management Unit system controller compatible for
> >>> Loongson-2K2000.
> >>>
> >>> This is a missing compatible, now we add it.
> >>>
> >>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> >>> ---
> >>>  .../devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml      | 1=
 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/soc/loongson/loongson,=
ls2k-pmc.yaml b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2=
k-pmc.yaml
> >>> index da2dcfeebf12..7473c5659929 100644
> >>> --- a/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pm=
c.yaml
> >>> +++ b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pm=
c.yaml
> >>> @@ -15,6 +15,7 @@ properties:
> >>>        - enum:
> >>>            - loongson,ls2k0500-pmc
> >>>            - loongson,ls2k1000-pmc
> >>> +          - loongson,ls2k2000-pmc
> >>
> >> Same thing here as the driver patch, the pmc on this newly added SoC
> >> appears to use the same codepaths as the existing ones. Does it share =
a
> >> programming model & should there be a fallback compatible here?
> >
> > I noticed the guideline about fallback compatible:
> >
> > "DO use fallback compatibles when devices are the same as or a subset
> > of prior implementations."
> >
> > But in fact, ls2k0500/ls2k1000/ls2k2000 are independent, there is no su=
bset.
>
> We do not consider here ls2k0500/ls2k1000/ls2k2000, but PMC in each of
> them. If they are independent, why would they use the same interface?

Sorry. I may have misunderstood.
The "subset" in the above guideline, here we should be talking about
PMC, not SoC.
For PMC, ls2k0500/ls2k1000/ls2k2000 are the same.

Am I understanding correctly now?

Also, when I said "independent" above, I meant they are three different SoC=
s.

Thanks.
Binbin
>
> > Can we define a "loongson,ls2k-pmc" superset for each ls2k SoC
> > compatible fallback.
> >
> > Such as:
> >
> >   compatible:
> >     oneOf:
> >       - enum:
> >           - loongson,ls2k0500-pmc
> >           - loongson,ls2k1000-pmc
> >           - loongson,ls2k2000-pmc
> >       - const: loongson,ls2k-pmc
>
> This is discouraged. Use 0500 as fallback.
>
>
>
> Best regards,
> Krzysztof
>
