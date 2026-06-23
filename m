Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA6F3C6A43
	for <loongarch@lists.linux.dev>; Tue, 23 Jun 2026 07:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782201517; cv=none; b=EAEv0e96DoK+XeF5+3Cv+4w+iqluScZwIOgoI3b+oGDkVg6m38eedl1m76hykneYQnyOkQek56tkcqzcdrZWW84kvZ9g8WkLRH5oubHf69wrgwXL+sZNdjBQWab+/TWpu+CqyITj3xKf7F0enuEfK1HMGugp/Lp1iU5+aApWShU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782201517; c=relaxed/simple;
	bh=khSZG1eYL9cJlphxXcESKKq9MlcJFe3CM8UDVhNeGyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dql88D2MGrQKp8JBEz0RYeSBS7+SMOTO8r7BAh7WBuu6yK9onBvtW3Gw0sFwe15DdSglgqyndrR9wQaPO8OWIUNZoBCj9XilPkucFgMJpzBCtVXMxSKQ98U85MwIyye5BLfEjS3AgUEy9OcrwfoCpzrohJRGDzjkQWnsb7jU8s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sqcr4xOj; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sqcr4xOj"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-845369f60faso3163328b3a.3
        for <loongarch@lists.linux.dev>; Tue, 23 Jun 2026 00:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782201516; x=1782806316; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ek6r0TkIKR0tiCQ28suwzM5bkNpctpIQyqr76NBcjWs=;
        b=sqcr4xOjKAqsGR0aA/brkW9/A7KTaV4xOvqV4IWnRlUdzplrKD9rX8ZM5S6Og9QtRP
         fLt30W1s3E3FlsPkfwZvOlSsu/oIjITJ1PoE9DGYC9rFWuQi9S10/STtMsjjYy6dx2uV
         84kSsgiBr2pSSFHSlSXPzNiyObOm2sjTM7Kg0boH+PlS1KPc9CaOaDw/FSoKPjCvz3Mt
         YhXQeZUU5FDj+vFZmf8/MVD832rUD8I8BTtMtdUQlUiJGL/tNdNI7QL5bBfCDA2wY3fU
         JwnyfIJChPc7iRkBFsCjhSNLeDgmfUOI1fiQYlhGxkoqrcY5ZsegCji/0L9HVt5hJnS6
         0sag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782201516; x=1782806316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ek6r0TkIKR0tiCQ28suwzM5bkNpctpIQyqr76NBcjWs=;
        b=L6ehtPqxksU1N9JLax1cilD+cQOMwJzVhMUKCk7GlJCLvr76Lnt9I1oYteM6YjYz7e
         RL2m5S7iM3PvuQQJqV2A9pRaDeoR5no3tRja5qEAAuO2SGl9AVPSigtiZIOBeDxt7qGT
         qQeQp8B6oXel814N55MA9Mj4CWhLT4AJGZ9bqLKsAS3QyJuz2mzfGL1eDV+IMKhVxFXA
         TfUTfMFQ8Q0+u8/iuciqponoK8xXaxH9QZqGGzW5uI1fav+sflgY2PfZpuSp1rX1DFXa
         1FSgm5Spi4vI3yMDM9rFtSLJbiwzg0Y5vGkzHHdZrIiA0FzfKBP36FfLkXuDid4WB8vj
         kQQA==
X-Forwarded-Encrypted: i=1; AHgh+RptcQFZxIPqzJU6BaivkHxwTCfTr5gMOGoROYcYKpC1gwRIc2+5wHhYRV/k25G8jU6mQCXZFJJe1Nw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyF4p9UXC4VcNXHnCL8iECJeePUCpO4AgU9RAU7rDwfaRGkmbpK
	muckbxrAZHwUpTtddzkQulBsjaEH3kxpLaneIZJJII1rzm1Oh1M3XSPm
X-Gm-Gg: AfdE7cmPsD6giz9+VKv2raLThUSMauZ+OKpTe5NU5mAZauOPWAbm5t1kiVOJvwqJ+Dn
	+K1dznzxVJ1ZyMSobr7QX5IYAygexLp7Biw879wZvCl22TV3CUDry/CqMIWLbsRrjiHxIACo8TM
	cc82twPhf9n4732Iag8RYd4godrwMY7Zev5ZQoAFe2VAajjY3PtZbZKKoJDhG0w+jmyVoi9eFZh
	BnEMFtSAC3OBeqfC1TB9OGKm3+zcAkbRCxYD9zexNdN7GBYapRuzneqwB+GUi2vvLabN2Dwv3MV
	v5sfSLnLBCpngxo6xGX35OYjK5005uIJqOpUoWE9b3A9PKkeI7P5JhzZ4flA1yx0TemJwwjkN2x
	5fgXX2YL9Zvet3ps96QggFWtHyKeoSbejCuHKLk/H7g+iT3c/Ac5FEc5++LqFWtgyp3jrODKKDy
	Ro9AeOtsNDglJHr/Vi2eLrmWYP0bOdfQATvLEiaNHw
X-Received: by 2002:a05:6a00:1707:b0:838:29b3:9ed1 with SMTP id d2e1a72fcca58-84550900333mr19117203b3a.41.1782201515623;
        Tue, 23 Jun 2026 00:58:35 -0700 (PDT)
Received: from zhr-ThinkStation-K.mioffice.cn ([2408:8607:1b00:8:ede9:3e72:37cf:55a2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e745besm9355930b3a.28.2026.06.23.00.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:58:35 -0700 (PDT)
From: Hongru Zhang <zhanghongru06@gmail.com>
X-Google-Original-From: Hongru Zhang <zhanghongru@xiaomi.com>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	baohua@kernel.org,
	bhe@redhat.com,
	chentao@kylinos.cn,
	chrisl@kernel.org,
	jack@suse.cz,
	kasong@tencent.com,
	kunwu.chan@gmail.com,
	liam@infradead.org,
	lianux.mm@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	liyangouwen1@oppo.com,
	ljs@kernel.org,
	loongarch@lists.linux.dev,
	mhocko@suse.com,
	nphamcs@gmail.com,
	nzzhao@126.com,
	pfalcato@suse.de,
	rppt@kernel.org,
	shikemeng@huaweicloud.com,
	surenb@google.com,
	vbabka@kernel.org,
	wanglian@kylinos.cn,
	willy@infradead.org,
	youngjun.park@lge.com,
	zhanghongru06@gmail.com
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page fault performance
Date: Tue, 23 Jun 2026 15:58:05 +0800
Message-ID: <20260623075805.466317-1-zhanghongru@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <3be9475b-0e8a-4df8-a130-4262f993973d@kernel.org>
References: <3be9475b-0e8a-4df8-a130-4262f993973d@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> On 5/20/26 23:15, Matthew Wilcox wrote:=0D
> > On Thu, May 21, 2026 at 05:14:20AM +0800, Barry Song wrote:=0D
> >> My understanding is that we should not blame applications here. This i=
s 2026:=0D
> >> there are basically only two kinds of applications =E2=80=94 single-th=
readed and=0D
> >> multi-threaded =E2=80=94 and single-threaded applications are nearly e=
xtinct.=0D
> > =0D
> > all of the applications i run are either single threaded or don't fork.=
=0D
> > what multithreaded applications call fork?=0D
>=0D
> Traditionally the problem was random libraries using fork+execve to launc=
h other=0D
> programs ... instead of using alternatives like posix_spwan (some use cas=
es=0D
> require more work done before execve and cannot yet switch to that). I'd =
hope=0D
> that that is less of a problem on Android.=0D
>=0D
> I assume Android zygote might be multi threaded? Maybe sshd as well? Syst=
emd?=0D
> But I'd be surprised if there are really performance implications.=0D
>=0D
> Not sure about webbroswers .... I think most of them switched to fork ser=
vers,=0D
> where I would assume fork servers would be single-threaded.=0D
>=0D
> So, yeah, getting a clear understanding how this ends up being a problem =
on=0D
> Android would be great.=0D
=0D
Barry asked me to share observations on fork() usage across Android=0D
applications.=0D
=0D
I wrote a BPF-based tracing tool (kprobe on copy_process, checking=0D
CLONE_VM to distinguish process creation from thread creation) and ran=0D
it against the top 200 Android applications in the China market during=0D
normal usage scenarios.=0D
=0D
Results:=0D
- 82 out of 200 apps (41%) call fork() during normal operation=0D
- Among these, some call fork() from multiple threads=0D
=0D
These are not zygote forks =E2=80=94 they are fork() calls initiated by app=
=0D
threads at runtime. Examples by category:=0D
=0D
  Browsers:     com.quark.browser, com.UCMobile, com.xunlei.browser=0D
  Shopping:     com.taobao.taobao, com.tmall.wireless, com.achievo.vipshop=
=0D
  Video:        com.youku.phone, com.qiyi.video, com.hunantv.imgo.activity=
=0D
  Social/IM:    com.alibaba.android.rimet, com.ss.android.lark=0D
  News:         com.ss.android.article.news, com.ss.android.article.lite=0D
  Navigation:   com.autonavi.minimap, com.sdu.didi.psnger=0D
  Finance:      com.eg.android.AlipayGphone, com.chinamworld.main=0D
=0D
This confirms that fork() is widely used in real-world multi-threaded=0D
Android applications. Since dup_mmap() needs to acquire=0D
vma_start_write() for every VMA, holding the VMA lock across I/O=0D
would risk blocking fork() for unpredictable durations in these 82=0D
applications.=0D
=0D
Tracing tool (two equivalent implementations):=0D
  bpftrace:         https://gist.github.com/zhr250/bf4384202d598bb4cda71cb9=
902f15ab=0D
  libbpf-bootstrap: https://gist.github.com/zhr250/76189bdf51bdc8818500e4c8=
917c6493=0D
=0D
Analysis results (top 200 apps):=0D
  https://gist.github.com/zhr250/06f51092c84a49c602a55ac3d186e9ce=0D
=0D
Hongru=0D
=0D
