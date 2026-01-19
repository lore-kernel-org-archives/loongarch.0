Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0C729BDBF
	for <loongarch@lists.linux.dev>; Mon, 19 Jan 2026 16:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839591; cv=none; b=n8Hwp7JNDtHPbc4CXhU6BLTKL0kDi6VqSEkIgio8q1drCcSbYKhdDvMIWw6AluTsfg490hyuCC8vbQh6C4F15vDmnKsH/set2697bxsg827GZcX75ETAa5g4AHP/kgbXDZGqHbu6qgN617E34O48VhYn6sCWBpgJSnsf5lfDWco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839591; c=relaxed/simple;
	bh=8d4KBvGi4mqgDhSXVw/x8t8Ybs5Ts2G8TRiYTltr33E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C3ryw2XvGgLj34/ro4WeaZ2gaDtZlMtwF0aOBEuq0G2o63Oi+Ik4CfupjDB0LVoYH0KszIj+7U1i+g7JrgT4rhvLaBHJ8BVyJRMMnHXHvrxqNs7Pm6Et6u3oqBftG72QTW5GFeq7fcdCPTzZxbezcGqAVTcyUzRP16CH3iKDrsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=msMJ6Kh+; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msMJ6Kh+"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-890228ed342so38863706d6.2
        for <loongarch@lists.linux.dev>; Mon, 19 Jan 2026 08:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768839588; x=1769444388; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHGYVuiqm5BGfNZEy0rG+8KeNo5nPSeV0Hqn9spxebA=;
        b=msMJ6Kh+tBuH3Y1bJawvAlgPkN4LiyrUPZ8Ejh2w9463X73rIFRRPvZhJlbtF0B8l+
         6YMfurvctexHSh3Nc2moABvzRdccm5CUbXDsQLfIFNLoC57JaMkHLYX1Pzd3vt+D1B7L
         qiPoCD82Fq9Zr4LEJNvS0iehOsboa/+3CWG4ag/vaxW/NI6hpBaRrLxlCIJKwDlMO8tn
         tJuOrXpjBuMsmV+XgHQQpuOXzBUkIhDHLtMQKizH/vEd01LNyZ6VGUSnU1xot5zczd/D
         yXW5L4rfvtQIe9E5OqWUlg4NEkNIDyXY0Lev/e6eQN+mVm2Gck42dmbBN+TwVCkKFGj8
         Rydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768839588; x=1769444388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pHGYVuiqm5BGfNZEy0rG+8KeNo5nPSeV0Hqn9spxebA=;
        b=jd1giQW8zoBp/+7nunQiCBWiubemrG5MWf9UP5rmSgWdGibULIZcLkYrPfONqYdM9p
         rlac4+XTJ9axnE5qgtIqgHcwOBiDZyMPG5ODcOfxeCfcG+90qJO7JmerPc8VTNTzIKfA
         EAfNSsdP0eYo58kX0VYs+nyX9iv75dNgFUEa3yDdLWgKLoX5hmt7ydGaPR2ujcoc1VBw
         Jb1xgiOcK77cQ4BhhCI3G+wnPuqlVvk3G4vLqksPNqBL/BA6rNus2gCJTFcgj5/EpK6/
         Oj8/yoGLGX/zZCCENfWr8xkR50eV41ppWnC6IU5QvBOvm5HAG1thApTh5kbVzfwWwUPW
         wn9g==
X-Forwarded-Encrypted: i=1; AJvYcCVbVz90hLJ26OWEYZ0RFzJqbnBBb9A0YqhZuTkHRS56EmSBIDeUkAdS5Uv6Id6cAambLHW9Aj+9zkI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzbFmJ7sZuX9H3YBQoiSpNFIXK50TtdnhpY0DSGwe2Vvp1JQZgb
	GS/3NZT+dsSCo1BReqqLSLncZ8Rw00orpvesFt8HaMLbvcwP1gFjzXLW8M4h+kjlcR652bLdPXm
	JQoPlLTKW2LATj00fCf3rr+NNwbjwqTT+CA==
X-Gm-Gg: AY/fxX7sJhsze0+LZ5AvjtCfVbo/77EtYXw/enJLes/N7rza4BqUYSghY/tYJSOMGxe
	HOeXpo9gTvDa4pzw9n3v79cc/TSlsQPZcMhhk9SZ1NRBYIHeyj7MjO9ULsI5woiL0tGT9Pvr/Hu
	2dsvJuox6KcgeLlEzUkXajKd4C0Z285nkIAVFwIJvjxs7857B8V00Tjc1KcUtnhjI+SYi+m6Mcs
	YjgK6Ou/xxmAV3BvYzv81xjxnsbmqV0qvFV4/ozWfqqIAFk4366EGddYJ2vqsgqymLxj6g=
X-Received: by 2002:a05:622a:1191:b0:501:17e3:30bb with SMTP id
 d75a77b69052e-502a1e29576mr153743741cf.25.1768839588516; Mon, 19 Jan 2026
 08:19:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK3+h2yu+XkEMWz6FOHiDEEQw-G_iKG2KHP=F=1CiqLr0mCgNA@mail.gmail.com>
 <d299d7ba-4e9e-5b16-5aa4-898b62330c24@loongson.cn> <CAK3+h2yFJDNVPo=38PcYCMNhmw0cQBouL5h7sX0KmyLu-_5zwQ@mail.gmail.com>
 <c15fd22f-9c36-bf8d-5bd4-02993147d113@loongson.cn>
In-Reply-To: <c15fd22f-9c36-bf8d-5bd4-02993147d113@loongson.cn>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Mon, 19 Jan 2026 08:19:37 -0800
X-Gm-Features: AZwV_Qi56HUO8Vswoqi5cUeeLkQ-FnXejoq6bZuiUoBuJvqsVqq5OYqF9Jdtkoo
Message-ID: <CAK3+h2xDBB023RQwFj9FmYVveR8qdg7RSDqU3xExsnNMY6A3pg@mail.gmail.com>
Subject: Re: [BUG?]: bpf/selftests: ns_bpf_qdisc libbpf: loading object
 'tc_bpf' from buffer
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: bpf <bpf@vger.kernel.org>, loongarch@lists.linux.dev, ast <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Hengqi Chen <hengqi.chen@gmail.com>, 
	Chenghao Duan <duanchenghao@kylinos.cn>, Huacai Chen <chenhuacai@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 5:01=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 2026/1/16 =E4=B8=8A=E5=8D=884:44, Vincent Li wrote:
> > On Wed, Jan 14, 2026 at 5:13=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongso=
n.cn> wrote:
>
> ...
>
> > Do you have proper instructions to compile gcc?
>
> git clone git://gcc.gnu.org/git/gcc.git gcc
> cd gcc && ./contrib/download_prerequisites --no-verify
> cp config.guess gettext/build-aux/config.guess && cp config.sub
> gettext/build-aux/config.sub
> cp config.guess gmp/config.guess && cp config.sub gmp/config.sub
> cp config.guess mpfr/config.guess && cp config.sub mpfr/config.sub
> cp config.guess mpc/build-aux/config.guess && cp config.sub
> mpc/build-aux/config.sub
> cp config.guess isl/config.guess && cp config.sub isl/config.sub
> rm -rf build && mkdir -p build && cd build
> ../configure --prefix=3D/usr/local/gcc --enable-checking=3Drelease
> --enable-languages=3Dc,c++ --disable-multilib
> make -j"$(nproc)"
> sudo rm -rf /usr/local/gcc && sudo make install
> export PATH=3D/usr/local/gcc/bin:$PATH
> export LD_LIBRARY_PATH=3D/usr/local/gcc/lib:$LD_LIBRARY_PATH
>
Thanks for the instruction.
> > I am not sure if it is toolchain related. The thing that really
> > bothered me is why the hell tc_bpf is loaded by libbpf for
> > ns_bpf_qdisc selftests that seems to have nothing to do with the
> > tc_bpf object, I can't think of anything special in my build machine
> > that would trigger this. Anyway, thanks for the help!
>
> I tested it again with lower version tool chains, the test still passed
> on my environment.
>
I suspect it is more of bpf selftests issue or tc related selftests
issue, I noticed for tests that invokes tc command to setup the
environment, I would hit the issue. I guess I am the only one to hit
this jackpot :). I do not know enough about the tc or selftests/libbpf
(loading object from buffer thing), someone with intimate knowledge
about that may have some clue. Thanks for the  gcc instruction again,
I may need it sometime in the future when I need to compile gcc.

> fedora@linux:~$ clang --version | head -1
> clang version 19.1.6 (Fedora 19.1.6-3.fc42)
> fedora@linux:~$ gcc --version | head -1
> gcc (GCC) 14.2.1 20241104 (Red Hat 14.2.1-6)
> fedora@linux:~$ as --version | head -1
> GNU assembler version 2.43.50.20241126
> fedora@linux:~$ pahole --version
> v1.31
> fedora@linux:~$ uname -r
> 6.19.0-rc6
> fedora@linux:~$ uname -m
> loongarch64
>
> Thanks,
> Tiezhu
>
