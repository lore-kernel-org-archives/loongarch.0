Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090138;
	b=pbY5oIj8Xyf3/jILq5rVgyN3FgplvW4dyga4shFxsV7uqGJM99LajsDahAks0BXuFYZ+
	 Gd760MHr7DaWY/yOPEgSuobnkEMk3DxBl8OFvFCaKRFT4YEIl0p0qdmUqgvpICWIfQCxh
	 HuMvfKOP6SXqWAA5z328TX17RvRVis2VVio7jMdzEZGfxu/NGRfyNIJuaOjbViaSM91ug
	 iOPcMGG0rjk41d4l5aaw8E2wpLSY1T5BqjuEgFzSXeO8NZcg+tFqCduv+YO4IGzDkhxtW
	 9SJEHiE3o0RQcCYd0OPFO2RPburW+r7RoLzlybI5Z0cs0Lcx13SQJBRu7tgGruKqaMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090138;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=uY+YiZ577XD8qMhbubbCAIi5KGrq6CT5swn6Jh3HfMs=;
	b=Qne+4XXXuHHvV7i6MLWC7z5S4/jIWs4wOMVo3qlkYSr8cdCxfxM6RnQxi//TVQN4gLH9
	 j1kqZ2qapRoyDx+aP/t+zkfkXqf7Ly17KcZrLg8qTD31wkQwzcpmXqk+ks9RUoO8NjLtA
	 OETP3LWZQ8jD9xqgephujzrntbDizwQ1fo+vTibEL1axQmqL2RJd+qYjK4yBOOCP0Pgie
	 GYZ9CEIWKmkIQERl0EPSCLqrv+blCAKaAOwjnjV3V7Szet59YtLDcguMhuQYiqXCPV0T1
	 o3XxsZtnBJLEM5HUVy7DlgBADfzPJvV5B7k9UQw4+ub3Cll1GVh1JiOOnN+c2RKfpYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZhryNa2I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A136606A325
	for <loongarch@lists.linux.dev>; Thu, 19 Nov 2026 12:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZhryNa2I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C384F1F000C9
	for <loongarch@lists.linux.dev>; Thu, 19 Nov 2026 12:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795090137;
	bh=uY+YiZ577XD8qMhbubbCAIi5KGrq6CT5swn6Jh3HfMs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZhryNa2IJ4uBkagNmZLzmhR2UAkOcNCr6EWt7Qlad5dtMmho5H7hKnOrTWoDrSbud
	 1r4U3+ePIODohJP2I9u4yxwaiQFkn5uWeBXv91TRZEEj/RsLuLhDXE2HZelotvZNGA
	 ihzEW44jGGdbCGCbzEzzsQEKFtcWDdVVSS3/ObXQxhg/Oe1nuCWdbM2U9atbQMSPHb
	 vl9K9jjyh56PFzrnuVS1hm3VSwiQvTiA7GJgGiPtA2Q6TpoPdiT6mORkeK40fLCaNW
	 WHUqNXuCvgv1aiKvXp4ifD+3nqzhZeDRFHJwnNzkLQU/kjRZ/7YOLziSMikIDQ7Q/V
	 idi/g/o0kwUug==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b8627e0eb2so3079140a12.2
        for <loongarch@lists.linux.dev>; Thu, 19 Nov 2026 04:08:57 -0800 (PST)
X-Gm-Message-State: APuU4Z9kEhMI66DdNvKxIdik0gTWGUd0OQd8BDRrMvHhe67XHuB36w5K
	pswu4CvFGDeMJFCHx1AYJHH0LW1f2z/LaPELgw3dJi2nvumhNZatMdMtflt6MUPPOglHP3Hi8xe
	TXWZioPQYD8TdISGs+Tta4YqhIFYDXqk=
X-Received: by 2002:a05:6402:1cc9:b0:6b8:9728:86d2 with SMTP id
 4fb4d7f45d1cf-6b89728889bmr4342388a12.31.1795090136418; Thu, 19 Nov 2026
 04:08:56 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119060503.4114-1-yangtiezhu@loongson.cn> <4d58c06e-87a2-f01e-a669-d8bef1dec340@loongson.cn>
 <fb963628-3a3a-637a-6836-65001bf369ef@loongson.cn>
In-Reply-To: <fb963628-3a3a-637a-6836-65001bf369ef@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 19 Nov 2026 20:08:46 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5_NJ+7QyzMdzA8RtvOH2ih+OLs43u-dkmmOoKTNzb7tw@mail.gmail.com>
X-Gm-Features: AclHuK_QorSfnZ4B2nextFqN3-0UlDIih7p8L6_3oQ9TdHAQl2HFQqv0llrvb4M
Message-ID: <CAAhV-H5_NJ+7QyzMdzA8RtvOH2ih+OLs43u-dkmmOoKTNzb7tw@mail.gmail.com>
Subject: Re: [PATCH v2] LoongArch: Fix preemptible warnings in cacheinfo and
 local TLB flush
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 3:46=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 11/19/26 2:09 PM, Tiezhu Yang wrote:
> > On 11/19/26 2:05 PM, Tiezhu Yang wrote:
> >> When CONFIG_DEBUG_PREEMPT is enabled on a Non-SMP kernel, calls to
> >> smp_processor_id() (including via current_cpu_data) in preemptible
> >> contexts trigger many "BUG: using smp_processor_id() in preemptible"
> >> warnings during cacheinfo setup and local TLB flushes.
>
> ...
>
> > After switching back to get_cpu() / put_cpu() (as in v1), this ASID
> > race completely disappears under the exact same test.
> >
> > So I think we should keep get_cpu() / put_cpu() in
> > local_flush_tlb_{mm,range,page}() (as in v1) to ensure preemption
> > safety, especially for UP preemptible kernels.
>
> If you are OK with the above analysis, I will send v3 (same to the
> code changes in v1, but need to update the commit message).
OK, please send V3, but I prefer the subject:
LoongArch: Fix preemptible warnings from smp_processor_id()

Huacai

>
> Thanks,
> Tiezhu
>
>
