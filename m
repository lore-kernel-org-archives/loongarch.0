Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271E0149DF0
	for <loongarch@lists.linux.dev>; Sat,  2 Aug 2025 13:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754142830; cv=none; b=Omjlt1Yf4BGv1m/42H2JuO5+ie2+laGKzAAcYfu/GRZglz8zNI+u5h5KqR61hASkd7cp7Q2G55DbKMzDfRcocBOkNiLZnzPF16I6BGcz4tLosjbQvMfoHlvaSzWReqxarw3dkUBHwn+Fty1AKTUkA7+la3AAl09Zs/qqH0meSRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754142830; c=relaxed/simple;
	bh=Ld3Ra23KIpuSA6JRFN1Ne+M3MCVkpEDn9b835RvPNMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cwT3NOSpFq+r6bMYd+Pr9dAvIbFvIFOOmceTV7bOjJqvdtWvycS2QVsRSmQXFT2Ly7S5kSknaBAfRTt+FiOP+HMHcv2KzEyLr4tC0mYfZ8o8c4+wVSPO+9+tCRSPACBhAeMkK7m+nFya8ZZu9uZyuJ1QupQcS/EE/I2sCFMSX3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ugws3JXT; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ugws3JXT"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ab5e2ae630so23236731cf.3
        for <loongarch@lists.linux.dev>; Sat, 02 Aug 2025 06:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754142827; x=1754747627; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jz7xdrrD45l/3xnqZOB8jhE8CYqKF5KgB+lJGaSRpW4=;
        b=Ugws3JXTEXRh8oJ5EZEzBFKFagmXf9hThL53pXXWZhQwZPShY1oeUw9JZZe1VxfYM7
         e0qKmppPw3TqfeQfiwZd9ypLVbTciOwrHsA2tlz8jy94XEjWxKJdhD/cKKy7S4Zp4U9Y
         22MQ/7RkEARJiHjoSs4n7tDWCo3inbxVbI1JUSe3bryrEy7SaGteO5KMvAi6c3tdMlm5
         YuGcx/jm5KKLJEUmCNgLYbBVpQMC4VtNOTJ1wuEKAMIdnxz4+LnzYcEkU8wn6Av4tk3V
         B+4F8ZlWwsGwMjq2nO46GNqqHmxhv4rCBLXcLWoATVbf9AnzQWnmSMCwJoh17ZGXczt7
         R4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754142827; x=1754747627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jz7xdrrD45l/3xnqZOB8jhE8CYqKF5KgB+lJGaSRpW4=;
        b=OcZgAgRHKOwaUTRePNEyG8HRB74vQMD7s5cDQ5qbPeKcoux95a2zdHGCQDI9CAhK8V
         X0UvE1pbKvn5yjJIl0nGbTFcFFrHCQ4Ej0//ts4tvIsKR8VL1ziQCbbfGbxAhJboTUhJ
         FifEMcIYvaWHrdi6W4TJIqAfmOJt4X5ls7dvLER3gWbFXwY2CuiQAsnHhnaCqnNmibo1
         MUqXK9rpILSpeWMGBXKoAaYMBaeblAcd8EEJ2IuhCCnF9ASWEJ9tWknEGwtEnf6YVk4R
         cp4MgQQwVSyzSV4sg0lBhRcafKEilL5r3pckTm3/iGy3WcG4q4cK5GOuJJiDpPQy6Mgq
         bfWw==
X-Forwarded-Encrypted: i=1; AJvYcCXxd0BEOQKV+wBkk3kodDmdgXuWaiRvE9yOnnQgCx0RDpSVvnXkwxn6JrjK2YGmmCTK19VI6H2j0PA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9GLxgySNYYA/K1CaLYZKVZIZOOLTqznXAXlgiwbN9n17OKso2
	QBDWTJBF/afxs8oh14EeLPvuOrqOEKYHH8Gyptv0MhRmnE6jNXrd4/2MAmjgeE7ObY4apIJnWn3
	9TLICPuoicQth84NDmkQc0tYvI7uEW+Y=
X-Gm-Gg: ASbGncvr8O7y4lJS+9DlMwBlRBYqUOwvDPdBd1EHlIa7afcdoV0/s8xfHumWxSc/dut
	YoAmphAs2MaB2eVQ0pvX9ukJTJpucyCrU8osHJxnZx37JbAxBft+iy/n3LkvDW/xzjRNgnQgQu7
	+MTFUjratxUqhlgxyNyIT2oT4jZ3hHZp0pQTRqgEVIJD36NeE0QEQ8sDnPXCQVTJOqe9eMUunUj
	bZ+RFE=
X-Google-Smtp-Source: AGHT+IE11LAzvqrdQXxiyZ9Ykheypkp7N+G+uzGNvGCzpqbRG0l7ORd2InUTNnfBd+A2SFlWMg+EF8886rMuNltS7jk=
X-Received: by 2002:ac8:594d:0:b0:4a4:2fad:7cdd with SMTP id
 d75a77b69052e-4af109cc72amr54695161cf.24.1754142826857; Sat, 02 Aug 2025
 06:53:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250730131257.124153-1-duanchenghao@kylinos.cn>
 <CAK3+h2wG-++Np7e-CZMbdjkL9tbuRi4bx+DP4RzLvJqu_+UY8A@mail.gmail.com> <84789726-18a6-b46f-3ece-f887599ccf4a@loongson.cn>
In-Reply-To: <84789726-18a6-b46f-3ece-f887599ccf4a@loongson.cn>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Sat, 2 Aug 2025 06:53:36 -0700
X-Gm-Features: Ac12FXzbawJXB94dfv3RJGAddS2YA0O_7ZiLoCdAnnAmBFGjFPvS7IR2hGkBZAA
Message-ID: <CAK3+h2x4MWR677UPTdAGX8jUg7EC_iweCKh8S1FMWSVVVsO8oA@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Support trampoline for LoongArch
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Chenghao Duan <duanchenghao@kylinos.cn>, hengqi.chen@gmail.com, chenhuacai@kernel.org, 
	kernel@xen0n.name, loongarch@lists.linux.dev, guodongtai@kylinos.cn, 
	youling.tang@linux.dev, jianghaoran@kylinos.cn, geliang@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 2, 2025 at 2:19=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn>=
 wrote:
>
> On 2025/8/1 =E4=B8=8B=E5=8D=881:21, Vincent Li wrote:
> > Hi Chenghao,
> >
> > I trimmed the email recipients only to the loongarch mailing list and
> > folks who might pay attention to this, I personally don't like to
> > bother other people who may not be interested in this :). Folks let me
> > know if this  is not ok. anyway, please check my bpf selftest result
> > inline.  The fentry_attach_stress results in kernel lockup.
>
> It passed on my test environment.
>
>    $ sudo ./test_progs -a fentry_attach_stress
>    #104     fentry_attach_stress:OK
>    Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
>
> I used loongson3_defconfig and the following additional configs:
>
> CONFIG_KPROBES=3Dy
> CONFIG_FUNCTION_ERROR_INJECTION=3Dy
> CONFIG_TEST_BPF=3Dm
> CONFIG_FTRACE=3Dy
> CONFIG_FUNCTION_TRACER=3Dy
> CONFIG_DYNAMIC_FTRACE=3Dy
> CONFIG_FPROBE=3Dy
> CONFIG_FTRACE_SYSCALLS=3Dy
> CONFIG_BPF_KPROBE_OVERRIDE=3Dy
> CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=3Dy
> CONFIG_DEBUG_INFO_BTF=3Dy
> CONFIG_NET_SCH_BPF=3Dy
> CONFIG_BPF_LSM=3Dy
> CONFIG_BPF_UNPRIV_DEFAULT_OFF=3Dn
> CONFIG_ARCH_STRICT_ALIGN=3Dn
>
> I am not sure whether it is related with configs, you can test it again.
>

Have you tried to run the same  fentry_attach_stress multiple times or
in a loop like while true; do ./test_progs -a fentry_attach_stress;
sleep 1; done
the lockup happens intermittently, sometime it PASSED, sometime kernel
locks up. I merged the tools/testing/selftests/bpf/config with my
original config by
./scripts/kconfig/merge_config.sh -y .config
tools/testing/selftests/bpf/config. my config seems including
everything  you listed above except CONFIG_ARCH_STRICT_ALIGN not set,
here is my config https://www.bpfire.net/download/loongfire/config.txt

> Thanks,
> Tiezhu
>
