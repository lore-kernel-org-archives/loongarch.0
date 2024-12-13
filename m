Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4531E22E8
	for <loongarch@lists.linux.dev>; Fri, 13 Dec 2024 15:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734102430; cv=none; b=Q0FbbawRivsPTQLppLUQ6nGFUylRHony7kqo3ITrpHACi50IaT3STort9FFLpw7FqbpVGQv5Vg84IzFmoWJXeyO/yC+b0RfuEU8wgjQen0KuvTRGpCh74aXz0cKsLmYBmPkOFZdh7O35UCjyNAUE6LJjqOrko8kgXf0KQ/OKrqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734102430; c=relaxed/simple;
	bh=KeUbuHRKIgv/HogaL/+ErSJahryWzkcm/96Y35zfph0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jn1J8QFK7IIWuzs4M5evC4WzjJoLUfjyqycmdKpGe+jab5Cc1ZCwVrpMw+3k2yDxLhOwKSIxzGsmw7HRiZh6jHFCnqhuRjRuJLeq52KfYUhq2DyeCxCLfPmKICS336XnDSa5l8xAQlyhOFXGQ3mCWILnKnS8GZl5GNtQ8p2enV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3nM6WAMJ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3nM6WAMJ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21625b4f978so125585ad.0
        for <loongarch@lists.linux.dev>; Fri, 13 Dec 2024 07:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734102428; x=1734707228; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOK+EabcLART//wNWq/2bx90ZPHXhDUCyx5nSPtp/mo=;
        b=3nM6WAMJDBsFJt4VqKvWlpX3+z4JhANfkz4C19E2D8gAUuCJ4urA3OhEfFycsVfg/t
         Ewt87r/BiF4EZ27mzWWZsq5zdJD56oNepWUpiRRblHnolKr8kiWd2SY8GbvqBirPZTaz
         zmDx57a6GixJLJhwNAEra3QRpQTXwjJEqWtv13ueYRbrLOvxN2p7bTYSmcwwKY9IOhQD
         tFb8yPhb0H07qQdzGz1zMGApzr1fXR8jK1zSQDKfWeJw1xKE1xFb5vle9Q1vYhk2l2u/
         Ceh0OiUg9rOoRcbNknbpnEP5T+LHWYnSZ7D0JMPk3VwH90A4b5aCUNnHT6voKixEZfQU
         8ZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734102428; x=1734707228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOK+EabcLART//wNWq/2bx90ZPHXhDUCyx5nSPtp/mo=;
        b=rCDU0aFLVl0F/ouG7VKBlP/+GriydVWp+4666que5iwFH+esJkslEyYm/ExeuMBVKN
         ZMe6WQLDDfdznr6SxTHvyC1u2aj0tAa/VowfSpIgf5SA7ZZSvIOhIxsTvp+CMqjmYCtH
         ngYoJPRUyf8SzUxo8oDo72kQfcA+BlXKDTPoVbS9Eh4VeuVdleSa/9HOc6SATpBOCTXw
         q5aLFTrOQgfTSNWLY1ujvLfmyKl0LvbgwnU0UvFdJG/TAujBMAtqgAzaVYJSbx/O99gT
         QTJkh96XijhbmsmtutTSA/aV64SEZk9fWU0TzGc3/HO5S5PfMSD5CiPKPoqoxyR/uRCS
         Q4cw==
X-Forwarded-Encrypted: i=1; AJvYcCVwmnZzFdd2jAJI14lak274Oenwtr81w2XHYhg11ys1rZwtTNwUJpx1ZlPM8z8OkSfwauDuUmzLWgo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwX/RRKSHXVDRCPFMKBSGf5GdvtyfoFn37Z4ppwscNERt0R9VuX
	WjM4ave4bXtzu305fdbyJyK5xWgfVlsAbmxwhzI9MJ4B4EZ5GvWuB9NtFDw6JqVdL8oAbIaEZC3
	kmz52CLF3BUqo3vh8zmMxm4wghob84J5UN1KZ
X-Gm-Gg: ASbGncu/c+dA/vyAKPujK7Zo/+Bwx7HNFoYhzhQestfukQToG36YjuYLRVskKLCTOZn
	0ecUMPQihUza2OENMgp/fNxMSgmIJrkE8mPzWRg==
X-Google-Smtp-Source: AGHT+IEFkkLrbUVuE/cQvOQQfUpzDKI51xwKn+aUa2wuLKN/e2/s4qkcLn7DHuV9QVymd56Ir4cx8C6BN8kJhz8qssU=
X-Received: by 2002:a17:902:da82:b0:215:44af:313b with SMTP id
 d9443c01a7336-21891d3ead6mr2786695ad.0.1734102427757; Fri, 13 Dec 2024
 07:07:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
 <hmuzfspqjzb36xlj2x44keihacrrhzj5madqrfbcnhqouzredv@wo75achgkuh5>
 <1818e2ea-f170-4a9c-8d93-2a24f2755a41@lucifer.local> <20241212173609.afd41d1dffbefe0d731ed4ed@linux-foundation.org>
 <695eabb8-ba28-4031-bc4d-66dc4f1d096f@lucifer.local>
In-Reply-To: <695eabb8-ba28-4031-bc4d-66dc4f1d096f@lucifer.local>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Fri, 13 Dec 2024 10:06:55 -0500
Message-ID: <CAC_TJvcdz854DmBoVRkb_B5j+u-t=4zHkLtHVeB5RJ=bXcBJag@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v2 00/16] mm: Introduce arch_mmap_hint()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, vbabka@suse.cz, 
	yang@os.amperecomputing.com, riel@surriel.com, david@redhat.com, 
	minchan@kernel.org, jyescas@google.com, linux@armlinux.org.uk, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 4:00=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Thu, Dec 12, 2024 at 05:36:09PM -0800, Andrew Morton wrote:
> > On Thu, 12 Dec 2024 22:51:34 +0000 Lorenzo Stoakes <lorenzo.stoakes@ora=
cle.com> wrote:
> >
> > > You've fundamentally violated kernel process and etiquette. I'd be mo=
re
> > > forgiving, but this is at v2 and you've not cc'd KEY people. Twice. T=
his is
> > > totally unacceptable. See [0] if you are unsure of how to do so.
> >
> > This feels excessive to me.  linux-mm averages a mere 140 mesages/day
> > and it seems reasonable to assume that key people are spending their 5
> > minutes to scroll through the email subjects.
>
> In practice we did all miss it, and I don't think it's unreasonable to as=
k
> people to run get_maintainers.pl to avoid this.
>
> In any case, I truly do think this series works better as RFC, I mean Lia=
m
> has already voiced the kind of disagreements I share with it, and we need
> to rethink how to approach it in general.
>
> So if this is simply sent as RFC with the correct cc's (and ideally with
> some review feedback applied - a better cover letter, etc.) then it makes
> everything easier.
>
> As mentioned the timing is unfortunate here, this is a series we really
> want to make sure is properly reviewed before any chance of merge so agai=
n
> this points to RFC being the way forward.

Hi everyone,

Sorry for the delayed response -- I was traveling and didn=E2=80=99t have
access to email.

Thank you for the feedback. I realize I missed some key reviewers in
the CC list for this patch.
When I ran get_maintainer.pl, it returned a large list of recipients.
To avoid over-CC=E2=80=99ing people (which has been an issue for me in the
past), I tried to trim it down to maintainers and a few others I
thought would be interested. Clearly, I got it wrong and missed some
key folks. That was not my intention, and I=E2=80=99ll make sure to fix it
when I resend the patch as an RFC.

On the technical side, Liam is right that the copy-pasted arch code
has inconsistencies (missing checks, order of checks, ...). I agree
there=E2=80=99s room for further consolidation. I=E2=80=99ll take another s=
tab at it
and resend it as an RFC with an updated cover letter, as Lorenzo and
others suggested.

Thanks,
Kalesh
