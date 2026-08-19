Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E2F41DE15;
	Wed, 19 Aug 2026 09:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787130657; cv=none; b=dUVxpk4OeqwaQ/8QsG3O5m2Dn4V2rQGSkkcgMk9bk6ygqE32KavKfeUQ//cWFzqSLfwFq5psU/cKmOyhcaY7l3Bjg9AbIUG3z2o7kvQQGk7wRmhMjS7lETmG2ihr+URb3NlyyHGcWJ6iRXLuMAFrOSvppDUV8iJ3EofKG27T4dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787130657; c=relaxed/simple;
	bh=SdqnMCDQJWY3OPZvpCz9aMJV/Mw2acfF6P0GHTlX4Is=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=F58xUeYC62K/0/RZNS8aKQGFwfNxfcqVHq+3p/nSQxjTl6OFeR89lPpXNjHezACPFycvWL50V5++IljYWSQYKtMRM/fhTmKsRAO2lWlB6Z11Aa+Mt7binQ0rtKRuXgmruG8P7b2NUcqwWybvT+RB4TPAalJEIczqAnW13AWinls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jm+Wv4aO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jm+Wv4aO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 515771F000E9;
	Wed, 19 Aug 2026 09:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787130655;
	bh=J7SSYr9IcCYlpEA9on/0aKPIvhje3Akfn6JxapVuH8c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=jm+Wv4aOzeOFTNGkTPTh1XF0zLQEggF3fxwAzmzCyumgDLdn0f12E8o3GI6dpHpkx
	 ETq719cOrx8P/ruQ1OJxqoaV19IPggFEEVmEBqif88yyb5XrXMNEfPHKjO7dmA0zCS
	 XaFElWeGHWsTS30cQNtt/qevs6nQq/+keyts6TX3TXgRXhfvB1K4d3ql/t8lPKcszG
	 IdyqmlqIkRCGbPEzYxe8te0Su4J+GenFyDoXocfpKndU9TV/tVXa/Ltjh18TONIhIP
	 7RHGNtpbny9da2Ar64FJ4mMWrHdQLxuAtcmC0/40KEVCTsjb1sNCzLYzFb8a/cj9DV
	 YxESBVfYEonbA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mukesh Pilaniya <mpilaniy@redhat.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Catalin Marinas
 <catalin.marinas@arm.com>,  Will Deacon <will@kernel.org>,  Mark Rutland
 <mark.rutland@arm.com>,  Huacai Chen <chenhuacai@kernel.org>,  WANG Xuerui
 <kernel@xen0n.name>,  Paul Walmsley <pjw@kernel.org>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,  Alexandre Ghiti
 <alex@ghiti.fr>,  Andrew Morton <akpm@linux-foundation.org>,  Baoquan He
 <baoquan.he@linux.dev>,  Mike Rapoport <rppt@kernel.org>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Tao Liu <ltao@redhat.com>,  Philipp Rudo
 <prudo@redhat.com>,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  loongarch@lists.linux.dev,
  linux-riscv@lists.infradead.org,  kexec@lists.infradead.org
Subject: Re: [PATCH] kexec: return -ENOEXEC from image probe functions on
 mismatch
In-Reply-To: <0d7acb43-2eb4-44ec-9bfb-b89440afc605@redhat.com> (Mukesh
	Pilaniya's message of "Wed, 19 Aug 2026 11:28:10 +0530")
References: <20260813-mpilaniy-v1-1-777d4d0e30f7@redhat.com>
	<2vxzv79c23j6.fsf@kernel.org>
	<9cbe111c-ff63-4f24-b518-094ddd7cea30@redhat.com>
	<2vxzbjaz2269.fsf@kernel.org>
	<0d7acb43-2eb4-44ec-9bfb-b89440afc605@redhat.com>
Date: Wed, 19 Aug 2026 11:10:50 +0200
Message-ID: <2vxzqzjuzd9h.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19 2026, Mukesh Pilaniya wrote:

> Hi Pratyush,
>
> On 18/08/26 3:14 pm, Pratyush Yadav wrote:
>> On Fri, Aug 14 2026, Mukesh Pilaniya wrote:
[...]
>>=20
>> So how about the below diff instead? (** only compile tested **)
>>=20
>> --- 8< ---
>> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
>> index 2bfbb2d144e6..cfb2b8cd5679 100644
>> --- a/kernel/kexec_file.c
>> +++ b/kernel/kexec_file.c
>> @@ -67,17 +67,16 @@ int kexec_image_probe_default(struct kimage *image, =
void *buf,
>>  			      unsigned long buf_len)
>>  {
>>  	const struct kexec_file_ops * const *fops;
>> -	int ret =3D -ENOEXEC;
>>=20=20
>>  	for (fops =3D &kexec_file_loaders[0]; *fops && (*fops)->probe; ++fops)=
 {
>> -		ret =3D (*fops)->probe(buf, buf_len);
>> -		if (!ret) {
>> +		if (!(*fops)->probe(buf, buf_len)) {
>>  			image->fops =3D *fops;
>> -			return ret;
>> +			return 0;
>>  		}
>>  	}
>>=20=20
>> -	return ret;
>> +	/* No loader found. */
>> +	return -ENOEXEC;
>>  }
> Nice catch, Pratyush but this discards all non-zero return values from
> probe functions, which means real errors get swallowed. For example,
> kexec_elf_probe() can return -ENOMEM when kzalloc() fails in
> elf_read_phdrs(). With this diff, that -ENOMEM becomes -ENOEXEC, which
> tells userspace "no loader found" when the actual problem was a memory
> allocation failure.

Right, good point.

>
>>=20=20
>>  static void *kexec_image_load_default(struct kimage *image)
>>=20
> How about the following instead? It keeps the probe return value and
> distinguishes -ENOEXEC (format not recognized, try next loader) from any
> other error (real failure, propagate immediately):
> =EF=BB=BF
> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> index 59fb9d71e9d8..ceb5c97cedac 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -68,17 +68,19 @@ int kexec_image_probe_default(struct kimage *image,
> void *buf,
>  			      unsigned long buf_len)
>  {
>  	const struct kexec_file_ops * const *fops;
> -	int ret =3D -ENOEXEC;
> +	int ret;
>
>  	for (fops =3D &kexec_file_loaders[0]; *fops && (*fops)->probe; ++fops) {
>  		ret =3D (*fops)->probe(buf, buf_len);
> -		if (!ret) {
> +		if (ret =3D=3D 0) {
>  			image->fops =3D *fops;
> -			return ret;
> +			return 0;
>  		}
> +		if (ret !=3D -ENOEXEC)
> +			return ret;
>  	}
>
> -	return ret;
> +	return -ENOEXEC;
>  }
>
>  static void *kexec_image_load_default(struct kimage *image)
>
>
> This requires probe functions to return -ENOEXEC from fixes in patch 1.
> I will add this as a separate patch on top in v2.
>
> Does this looks good to you ?

LGTM. The only thing I'd change is to perhaps move the declaration of
ret inside the loop so it can never be used outside it, since ret is
only useful in the loop in this function.

--=20
Regards,
Pratyush Yadav
