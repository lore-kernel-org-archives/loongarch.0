Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE7D1C860C
	for <loongarch@lists.linux.dev>; Sat, 20 Dec 2025 14:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766239659; cv=none; b=LREU/hfS/ajtQYMV6rkgP19ZYP3yDIOzy4Z5pWr4tqvF+PDHnLiFxPoUHzgkGrSwFaq3ZkN97yyfpXJtEYOl+Oae+X2D06S86wuXVwM7YZ1OXIk7zjNLKiXIVqxLTaxJgdNFrWZl+pPa6/qaYbfYBXfyu/ApHcSa1FjYqOQTpcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766239659; c=relaxed/simple;
	bh=ppuzKfXdvO9jvlXXAJ3Z8CDIdqR8C/0djsmJ/G/zQqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZRykYfHxaauevmI8aHXFjpUkg/U7EalHd09gORPT0MGVoylfTePUm050rJT42nRImQ66+qCg1XND3ERWnWy8nQ3anj9kdxQc5QmxkfJY9zECEKVcoxVK1Wf3AS+ziPvKmLkYQnkEIRrd7xImQqV40dROycoYpw+XUb0lIXIGdQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gwWba8Yf; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gwWba8Yf"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-44ffed84cccso644668b6e.0
        for <loongarch@lists.linux.dev>; Sat, 20 Dec 2025 06:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766239657; x=1766844457; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tc1iEedM1caQ6hqBuO/lN1WSU9IfL3Q4FFgEU8l0tOA=;
        b=gwWba8YfVuAZOiMX2LdhP3EkH45pbLyawm5JAV4J1hMDB95liyd7nfuf9wyYtH3xf7
         vP1AeWfnFnQX8KKpRTwvHqgZEBHGZ6jFIq913fUiI9CMXTp5I3CtrNm/thw7N6Janlwf
         gk2S9V4f+Els3icfC5kTSLS080xRn7/kRL77S3/NqHMFP4LoyzfcaRbM541eODvqB9jD
         whKPB5CBdqDZ0PcWFL/AGThEGePWnT5skJ8ekWtGj6l0mHoWygJCCDcyLu8gf7GXT+8d
         Ht/TqY2j5qdaz+D5lvnziFC3VqFF+hHRoRNb0flqlc+WbWW55fOzTQdaJvKkFt6K60Kk
         6Djw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766239657; x=1766844457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tc1iEedM1caQ6hqBuO/lN1WSU9IfL3Q4FFgEU8l0tOA=;
        b=tYLKTn6Qk9fpUTYdMN/bJ30LTkVKMfUTjju8TRzSSZtoZ8hGjjlmGRJv1dkXjEaT1k
         zakdCG9Kiv1+XyG2AisDy/FR/fY7TUBpgphP4OQhoupXN93grAc/cAXgAFWMBVYrHq27
         gkpERaji6A/zE4Nvc0efehlGmh9z+uFCl6SWy72g2ilP7Q83x1m+RoEoVvRYP3ou1vvb
         ikGJx7tcYzFISpxMWyDTBSIbCj3CWGx0ps45pI2Si6JJjNWGujnU8BBvHBYC5K3xxBZi
         wUuo2JN0d6oiOjIZY7ApU3kjpWFGqvalI8DcNLT6cf2U9c7fZDfCD7AK06znDA520hFu
         Cl8w==
X-Forwarded-Encrypted: i=1; AJvYcCWHehKfBmj3HtzUSo9/qJesl+L3qEmwvhfO/UtXFTsGz29eE6q+0Y5EL5R95Ej2kAdpmuQlJzHLbo8=@lists.linux.dev
X-Gm-Message-State: AOJu0YymfeQIQDWKwrwSlZm70iEA6CkcZxpVB6FcL3kuVzPrnvPjQl3A
	X9hZWDuMaoXNvy6vCNYKGSo0objQbmKfWPyrZ9tF2QBe0KgAV/42qVlneihwrJzchexdAM6/gIe
	ElHqPWSTMyRV3XEvSArXy6TXWOtxqqUk=
X-Gm-Gg: AY/fxX6suLE5C2bfI+EF/8WSG0iDbLWuw0ZwX8xGYB4YkeJNUB/q/YkV/FUtaG2Qrnf
	IBcEekHW4tpiuCX73p3nBzMT0PLB4hIp6pgJ30LPwmOMlHnsdcPAgVP1JaThTYhsOiynN2nvR25
	e8ez8gYtb83heqTGPF795ux3VirgN5MOLZgDKOSQprUuF3t55lSW/iVp8YdZWnbeqUj9Hkrv9Qi
	HmSTvBHDKVayBIEblsW5rgAQ8hR7H1SKM2SFn8kyN/lyvB7wCFvNjEeTSnRLwvfzmxLg1k=
X-Google-Smtp-Source: AGHT+IFKJvWy/VbyNKsiekvuWECXFOl3II4PdAI1c5BeYHGXBeL5yRX9cLnJ1GnL00cdoCslt6FVO9gv5pYDRsHn0iU=
X-Received: by 2002:a05:6808:c1ae:b0:442:e596:1189 with SMTP id
 5614622812f47-457b223fceemr2941683b6e.45.1766239656930; Sat, 20 Dec 2025
 06:07:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251217061435.802204-1-duanchenghao@kylinos.cn> <20251217061435.802204-7-duanchenghao@kylinos.cn>
In-Reply-To: <20251217061435.802204-7-duanchenghao@kylinos.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Sat, 20 Dec 2025 22:07:25 +0800
X-Gm-Features: AQt7F2qcrrU65Yn384r_DbQIv295t02mQ5NXmH0yR08XLRQSjXo2M45Sl0nHU1M
Message-ID: <CAEyhmHRbacxpfTkPJq4MerBupH0bJkFfx8xGUvHMvGOzDDJUow@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] LoongArch: BPF: Enhance the bpf_arch_text_poke() function
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: yangtiezhu@loongson.cn, rostedt@goodmis.org, mhiramat@kernel.org, 
	mark.rutland@arm.com, chenhuacai@kernel.org, kernel@xen0n.name, 
	zhangtianyang@loongson.cn, masahiroy@kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, bpf@vger.kernel.org, youling.tang@linux.dev, 
	jianghaoran@kylinos.cn, vincent.mc.li@gmail.com, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 2:15=E2=80=AFPM Chenghao Duan <duanchenghao@kylinos=
.cn> wrote:
>
> Enhance the bpf_arch_text_poke() function to enable accurate location
> of BPF program entry points.
>
> When modifying the entry point of a BPF program, skip the move t0, ra
> instruction to ensure the correct logic and copy of the jump address.
>
> Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
> ---
>  arch/loongarch/net/bpf_jit.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 3dbabacc8856..0c16a1b18e8f 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -1290,6 +1290,10 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_pok=
e_type old_t,
>                        void *new_addr)

The signature of bpf_arch_text_poke() was changed in v6.19 ([1]), please re=
base.

  [1]: https://github.com/torvalds/linux/commit/ae4a3160d19cd16b874737ebc17=
98c7bc2fe3c9e

>  {
>         int ret;
> +       unsigned long size =3D 0;
> +       unsigned long offset =3D 0;
> +       char namebuf[KSYM_NAME_LEN];
> +       void *image =3D NULL;
>         bool is_call;
>         u32 old_insns[LOONGARCH_LONG_JUMP_NINSNS] =3D {[0 ... 4] =3D INSN=
_NOP};
>         u32 new_insns[LOONGARCH_LONG_JUMP_NINSNS] =3D {[0 ... 4] =3D INSN=
_NOP};
> @@ -1297,9 +1301,18 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_pok=
e_type old_t,
>         /* Only poking bpf text is supported. Since kernel function entry
>          * is set up by ftrace, we rely on ftrace to poke kernel function=
s.
>          */
> -       if (!is_bpf_text_address((unsigned long)ip))
> +       if (!__bpf_address_lookup((unsigned long)ip, &size, &offset, name=
buf))
>                 return -ENOTSUPP;
>
> +       image =3D ip - offset;
> +       /* zero offset means we're poking bpf prog entry */
> +       if (offset =3D=3D 0)
> +               /* skip to the nop instruction in bpf prog entry:
> +                * move t0, ra
> +                * nop
> +                */
> +               ip =3D image + LOONGARCH_INSN_SIZE;
> +
>         is_call =3D old_t =3D=3D BPF_MOD_CALL;
>         ret =3D emit_jump_or_nops(old_addr, ip, old_insns, is_call);
>         if (ret)
> --
> 2.25.1
>
